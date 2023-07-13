# Proyecto-AC
Este es un código escrito en lenguaje ensamblador que se puede usar para sumar, restar, multiplicar o dividir números complejos. El código está diseñado para ser ejecutado en un sistema operativo DOS, y se ha formateado como un archivo .COM que puede ser cargado y ejecutado directamente en memoria.

El código comienza en la dirección de memoria 100h y tiene dos secciones principales: .data y .text. La sección .data contiene definiciones de variables utilizadas en el programa, mientras que la sección .text contiene el código que realiza las operaciones.

El programa comienza mostrando un mensaje de bienvenida y pidiendo al usuario que introduzca un número. Luego, el programa solicita al usuario que introduzca un operador aritmético (+, -, *, /) y un segundo número. Dependiendo del operador introducido por el usuario, el programa realiza la operación correspondiente y muestra el resultado.

El código utiliza una serie de interrupciones del sistema DOS, a través de la función INT 21h, para mostrar mensajes en la pantalla y recibir entrada del usuario.

En resumen, este es un programa simple escrito en lenguaje ensamblador que realiza operaciones aritméticas en números complejos. Para ejecutarlo, simplemente cargue el archivo .COM en la memoria y comience a usarlo.
