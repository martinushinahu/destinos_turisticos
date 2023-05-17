from flask import Flask, render_template, request, url_for,redirect,flash
import os
import mysql.connector
import math
from bs4 import BeautifulSoup
import requests
import secrets


template_dir = os.path.dirname(os.path.abspath(os.path.dirname(__file__)))
template_dir = os.path.join(template_dir, 'src', 'templates')
app = Flask(__name__, template_folder=template_dir)
app.secret_key = secrets.token_hex(16)

# Configuración de la conexión a la base de datos
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'admin'
app.config['MYSQL_DB'] = 'destinos_turisticos'

# Función para conectar a la base de datos
def connect_to_database():
    cnx = mysql.connector.connect(user=app.config['MYSQL_USER'], password=app.config['MYSQL_PASSWORD'],
                                  host=app.config['MYSQL_HOST'], database=app.config['MYSQL_DB'])
    cursor = cnx.cursor()
    return cnx, cursor

# Ruta para la página principal
@app.route('/', methods=['GET'])
def index():
    # Obtener la lista de países de la base de datos
    conn, cursor = connect_to_database()
    query = "SELECT DISTINCT country FROM lugares_turisticos"
    cursor.execute(query)
    paises = [x[0] for x in cursor.fetchall()]
    cursor.close()
    conn.close()
    return render_template('index.html', paises=paises)

# Ruta para mostrar los resultados de la consulta
@app.route('/resultados', methods=['GET', 'POST'])
def resultados():

    # Verificar si se recibió un formulario de búsqueda
    if request.method == 'POST':
        # Obtener el país ingresado por el usuario
        pais = request.form['pais']

        # Si no se ingresó un país, mostrar un mensaje de error
        if not pais:
            flash('Por favor, ingresa un país válido.')
            return redirect(request.url)

        # Redirigir a la misma página pero con el parámetro 'pais'
        return redirect(url_for('resultados', pais=pais))

    # Obtener el país seleccionado por el usuario
    pais = request.args.get('pais')
        

    # Si no se especificó el país, mostrar un mensaje de error
    if not pais:
        flash('Por favor, ingresa el nombre de un país.')
        return render_template('resultados.html')

    # Obtener el número de página actual
    pagina = request.args.get('pagina', default=1, type=int)

    # Definir el número de resultados que se mostrarán por página
    resultados_por_pagina = 10
    
    # Realizar la consulta a la base de datos para obtener el número total de resultados
    conn, cursor = connect_to_database()
    query = "SELECT COUNT(*) FROM lugares_turisticos WHERE country = %s"
    cursor.execute(query, (pais,))
    total_resultados = cursor.fetchone()[0]
    
    # Calcular el número total de páginas
    total_paginas = math.ceil(total_resultados / resultados_por_pagina)
    
    # Calcular el índice de inicio y fin de los resultados de la página actual
    inicio = (pagina - 1) * resultados_por_pagina
    fin = inicio + resultados_por_pagina
    
    # Realizar la consulta a la base de datos para obtener los resultados de la página actual
    query = "SELECT name, maps_url FROM lugares_turisticos WHERE country = %s LIMIT %s, %s"
    cursor.execute(query, (pais, inicio, resultados_por_pagina))
    resultados = cursor.fetchall()
    
    # Cerrar la conexión a la base de datos
    cursor.close()
    conn.close()
    
    # Verificar si se encontraron resultados
    if resultados:
        # Pasar los resultados y las variables de paginación a la plantilla
        return render_template('resultados.html', resultados=resultados, pais=pais, pagina=pagina,
                               total_paginas=total_paginas, resultados_por_pagina=resultados_por_pagina,
                               total_resultados=total_resultados
                               )
    
    # Si no se encontraron resultados para el país, mostrar un mensaje de error
    flash(f'No se encontraron lugares turísticos para {pais}.')
    return render_template('resultados.html', resultados=resultados, pais=pais,)





@app.route('/resultados/siguiente', methods=['POST'])
def siguiente_resultado():
    # Obtener el país seleccionado por el usuario o establecer un valor predeterminado si no se proporciona
    pais = request.form.get('pais')

    # Obtener el número de página actual
    pagina_actual = int(request.form.get('pagina', 1))

    # Calcular el número de página siguiente
    pagina_siguiente = pagina_actual + 1

    # Definir el número de resultados que se mostrarán por página
    resultados_por_pagina = 10

    # Realizar la consulta a la base de datos para obtener el número total de resultados
    conn, cursor = connect_to_database()
    query = "SELECT COUNT(*) FROM lugares_turisticos WHERE country = %s"
    cursor.execute(query, (pais,))
    total_resultados = cursor.fetchone()[0]

    # Calcular el número total de páginas
    total_paginas = math.ceil(total_resultados / resultados_por_pagina)

    # Verificar si hay una página siguiente y si es válida
    if pagina_siguiente <= total_paginas:
        # Calcular el índice de inicio y fin de los resultados de la página siguiente
        inicio = (pagina_siguiente - 1) * resultados_por_pagina
        fin = inicio + resultados_por_pagina

        # Realizar la consulta a la base de datos para obtener los resultados de la página siguiente
        query = "SELECT name, maps_url FROM lugares_turisticos WHERE country = %s LIMIT %s, %s"
        cursor.execute(query, (pais, inicio, resultados_por_pagina))
        resultados = cursor.fetchall()

        # Cerrar la conexión a la base de datos
        cursor.close()
        conn.close()

        # Pasar los resultados y las variables de paginación a la plantilla
        return render_template('resultados.html', resultados=resultados, pais=pais, pagina=pagina_siguiente,
                               total_paginas=total_paginas, resultados_por_pagina=resultados_por_pagina,
                               total_resultados=total_resultados)

    # Si no hay una página siguiente o no es válida, redirigir a la última página
    return redirect(url_for('resultados', pais=pais, pagina=total_paginas))






@app.route('/resultados/redireccionar', methods=['GET', 'POST'])
def redireccionar_resultados():
    pais = request.form.get('pais') or request.args.get('pais')
    pagina_actual = int(request.form.get('pagina') or request.args.get('pagina', 1))
    accion = request.form.get('accion')

    if accion == 'siguiente':
        pagina_siguiente = pagina_actual + 1
        return redirect(url_for('resultados', pais=pais, pagina=pagina_siguiente))
    elif accion == 'anterior':
        pagina_anterior = pagina_actual - 1
        return redirect(url_for('resultados', pais=pais, pagina=pagina_anterior))
    else:
        # Si el usuario no presionó ninguno de los botones, redirige a la página de resultados actual
        return redirect(url_for('resultados', pais=pais, pagina=pagina_actual))




if __name__ == '__main__':
    app.run(debug=True, port=4000)
