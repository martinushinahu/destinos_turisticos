## 🌟 Aplicación de Consulta de Lugares Turísticos por Países
Esta aplicación te permite generar consultas de lugares turísticos por país. 
Puedes buscar información sobre diferentes lugares turísticos en todo el mundo
te brinda total de lugares turísticos por país y un mapa de su ubicación.

## 🌟 Contenido
- "Esta aplicación fue desarrollado en Python y usando el framework Flask."
- "Se usó API de OpenTripMap para obtener las coordenadas de los países a consultar."
- "Se usó API de OSM para obtener el nombre de los países de acuerdo a sus coordenadas para que sean ingresado a la base de datos."
- "Se usó API de Google Maps Static para obtener las imagenes de los mapas de acuerdo a las coordenadas de los lugares turísticos."
- "Se aplicó Pandas para realizar el analisis de los datos, Json para guardar la data de los países, Mysql para la conexión con nuestra base de datos."
- "Se aplicó tkinter para realizar una interfaz de prueba para la funcionalidad de nuestras consultas."

## 🌟 Diseño de la Interfaz
- Aquí se muestra el diseño de la app de consulta
![Image text](https://github.com/martinushinahu/destinos_turisticos/blob/636a42afb0297866796a553cb59a887e3f896e59/Analisis%20Tutisticos/imagenes_app/interfaz.png)

- Escoges el país a seleccionar
![Image text](https://github.com/martinushinahu/destinos_turisticos/blob/master/Analisis%20Tutisticos/imagenes_app/interfaz2.png)

- Y te muestra el resultados de acuerdo al país seleccionado, el resultado total y al costado la imgen del mapa donde se ubica dicho lugar
![Image text](https://github.com/martinushinahu/destinos_turisticos/blob/master/Analisis%20Tutisticos/imagenes_app/resultados.png)


## 🌟 Optención de los datos

1. Clona este repositorio en tu máquina local:
    ```bash
    git clone https://github.com/martinushinahu/destinos_turisticos.git
    ```
2. Instala las dependencias necesarias
    ```bash
    pip install -r requirements.txt
    ```
3. Ejecute la Aplicación
    ```bash
    python app.py
    ```



