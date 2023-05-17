// document.addEventListener('DOMContentLoaded', function() {
//     var btnCargarMas = document.querySelector('#btn-cargar-mas');
//     var paginaActual = {{ pagina }};
//     var totalPaginas = {{ total_paginas }};
//     var resultadosPorPagina = {{ resultados_por_pagina }};
//     var pais = "{{ pais }}";
    
//     btnCargarMas.addEventListener('click', function() {
//       var nuevaPagina = paginaActual + 1;
      
//       var xhr = new XMLHttpRequest();
//       xhr.open('GET', '/resultados?pais=' + pais + '&pagina=' + nuevaPagina);
//       xhr.onload = function() {
//         if (xhr.status === 200) {
//           var nuevosResultados = xhr.responseText;
//           document.querySelector('tbody').insertAdjacentHTML('beforeend', nuevosResultados);
          
//           paginaActual = nuevaPagina;
          
//           // Ocultar el botón "Cargar más resultados" si ya no hay más páginas
//           if (nuevaPagina >= totalPaginas) {
//             btnCargarMas.style.display = 'none';
//           }
//         }
//       };
//       xhr.send();
//     });
//   });
  