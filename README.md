# Sistema de gestión de cursos y estudiantes

Programa de consola en Dart que permite administrar cursos y los
estudiantes inscritos en cada uno.
Sofía Moncada Jaramillo / Lenguaje de Programación APPs 

1. Descripción del proyecto

Este proyecto es un programa de consola hecho en Dart que sirve para administrar cursos y los estudiantes inscritos en cada uno. El usuario interactúa con el programa por medio de un menú: escribe el número de la opción que quiere y el sistema realiza la acción.

El programa no usa Flutter, interfaz gráfica, base de datos ni API. Toda la información se guarda en la memoria del computador mientras el programa está abierto, así que al cerrarlo los datos se pierden.

## 2. Funcionalidades
 
| Opción | Qué hace |
|---|---|
| 1. Registrar curso | Crea un curso nuevo con código, nombre, docente y cupo máximo |
| 2. Consultar todos | Muestra todos los cursos registrados |
| 3. Buscar por nombre | Busca cursos por el nombre (o una parte de él) |
| 4. Modificar | Cambia el nombre, el docente o el cupo de un curso |
| 5. Eliminar | Elimina un curso (pide confirmación antes) |
| 6. Mostrar resumen | Muestra total de cursos, estudiantes inscritos, cursos llenos y cursos por docente |
| 7. Inscribir estudiante | Agrega un estudiante a un curso |
| 0. Salir | Cierra el programa |

## 3. Estructura del proyecto
 
Todo el código está en la carpeta `bin/`:
 
| Archivo | Qué contiene |
|---|---|
| `bin/main.dart` | El menú principal y el `switch` que controla las opciones |
| `bin/curso.dart` | La clase `Curso` con sus atributos, constructor y métodos |
| `bin/gestion_cursos.dart` | Las funciones del sistema (registrar, listar, buscar, modificar, eliminar, inscribir y resumen) |
| `bin/validaciones.dart` | Las funciones para leer datos por consola y validarlos |

## 4. Conceptos de Dart usados
 
- **Variables, constantes y tipos de datos:** `String`, `int`, `bool`. Constantes: `titulo` y `cupoMinimo`.
- **Condicionales `if / else`:** para validar datos y decidir qué mensaje mostrar.
- **`switch`:** controla el menú principal en `main.dart` y el submenú de modificar.
- **Ciclos:** `while` para repetir el menú y las preguntas; `for-in` para recorrer los cursos.
- **Funciones:** cada operación del sistema está separada en su propia función.
- **List:** `cursos` guarda todos los objetos `Curso` registrados.
- **Set:** `codigosUsados` evita que se repitan los códigos de los cursos, y `estudiantes` (dentro de `Curso`) evita inscribir dos veces al mismo estudiante.
- **Map:** `cursosPorDocente` guarda cuántos cursos dicta cada docente (docente → cantidad) y se usa en el resumen.
- **Validaciones:** campos vacíos, números inválidos, códigos repetidos, cursos inexistentes, cupos llenos y estudiantes repetidos.

## 6. Investigación: clases y objetos
 
### ¿Qué es una clase?
 
Una clase es como un molde. Sirve para decir cómo va a ser algo y qué datos y acciones va a tener, pero todavía no es algo real. Por ejemplo, la clase `Curso` es el molde que dice que todo curso tiene un código, un nombre, un docente y un cupo.
 
### ¿Qué es un objeto?
 
Un objeto es algo real que se construye usando el molde (la clase). Si `Curso` es el molde, un curso concreto como "Programación para APPs" con su código, su docente y su cupo es un objeto.
 
### ¿Cuál es la diferencia entre una clase y un objeto?
 
La clase es la idea o el plano; el objeto es la cosa ya construida. Con una sola clase se pueden crear muchos objetos, cada uno con sus propios datos. En el proyecto hay una clase `Curso`, pero puedo registrar muchos cursos distintos, y cada uno es un objeto diferente.
 
### ¿Qué es un atributo?
 
Un atributo es una característica o dato que guarda un objeto. En mi clase, los atributos son `codigo`, `nombre`, `docente`, `cupoMaximo` y `estudiantes`.
 
### ¿Qué es un método?
 
Un método es una acción que sabe hacer un objeto. Es una función que vive dentro de la clase. En `Curso` hay cuatro: `cuposDisponibles()` calcula cuántas sillas libres quedan, `hayCupo()` dice si todavía se puede inscribir a alguien, `inscribirEstudiante()` agrega un estudiante y `mostrarInformacion()` imprime los datos del curso.
 
### ¿Para qué sirve un constructor?
 
El constructor es la parte de la clase que se ejecuta cuando se crea un objeto. Sirve para darle sus datos iniciales. En mi proyecto, el constructor `Curso(this.codigo, this.nombre, this.docente, this.cupoMaximo)` recibe los cuatro datos y los guarda en el objeto nuevo.
 
### Aplicación en el proyecto
 
La clase `Curso` está en `bin/curso.dart`.
 
- **Atributos:** `codigo`, `nombre`, `docente`, `cupoMaximo` y `estudiantes` (un `Set` con los nombres de los inscritos).
- **Constructor:** `Curso(this.codigo, this.nombre, this.docente, this.cupoMaximo)`.
- **Creación de un objeto:** en la función `registrarCurso()` (archivo `bin/gestion_cursos.dart`), cuando el usuario escribe los datos, se crea el objeto con `Curso nuevo = Curso(codigo, nombre, docente, cupo);` y se guarda en la lista `cursos`.
- **Métodos:** `cuposDisponibles()`, `hayCupo()`, `inscribirEstudiante()` y `mostrarInformacion()`. Por ejemplo, `listarCursos()` recorre la lista y le pide a cada curso que se muestre con `mostrarInformacion()`.

## 7. Ejemplo de uso
 
```
SISTEMA DE GESTIÓN DE CURSOS Y ESTUDIANTES
-----------------------------
1. Registrar curso
2. Consultar todos
3. Buscar por nombre
4. Modificar
5. Eliminar
6. Mostrar resumen
7. Inscribir estudiante
0. Salir
-----------------------------
Seleccione una opción:
```