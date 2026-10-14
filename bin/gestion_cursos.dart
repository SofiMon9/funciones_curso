import 'curso.dart';
import 'validaciones.dart';

const int cupoMinimo = 1;

List<Curso> cursos = [];
Set<String> codigosUsados = {};

Curso? buscarPorCodigo(String codigo) {
  for (Curso curso in cursos) {
    if (curso.codigo == codigo) {
      return curso;
    }
  }
  return null;
}

void registrarCurso() {
  print('\n--- REGISTRAR CURSO ---');
  String codigo = leerTexto('Código del curso: ').toUpperCase();

  if (codigosUsados.contains(codigo)) {
    print('Error: ya existe un curso con el código $codigo.');
    return;
  }

  String nombre = leerTexto('Nombre del curso: ');
  String docente = leerTexto('Docente: ');
  int cupo = leerEntero('Cupo máximo de estudiantes: ', cupoMinimo);

  Curso nuevo = Curso(codigo, nombre, docente, cupo);
  cursos.add(nuevo);
  codigosUsados.add(codigo);
  print('Curso registrado correctamente.');
}
void listarCursos() {
  print('\n--- LISTA DE CURSOS ---');

  if (cursos.isEmpty) {
    print('No hay cursos registrados.');
    return;
  }

  for (Curso curso in cursos) {
    curso.mostrarInformacion();
  }
}

void buscarCurso() {
  print('\n--- BUSCAR CURSO ---');
  String texto = leerTexto('Escriba el nombre a buscar: ').toLowerCase();
  bool encontrado = false;

  for (Curso curso in cursos) {
    if (curso.nombre.toLowerCase().contains(texto)) {
      curso.mostrarInformacion();
      encontrado = true;
    }
  }

  if (!encontrado) {
    print('No se encontraron cursos con ese nombre.');
  }
}

void modificarCurso() {
  print('\n--- MODIFICAR CURSO ---');
  String codigo = leerTexto('Código del curso a modificar: ').toUpperCase();
  Curso? curso = buscarPorCodigo(codigo);

  if (curso == null) {
    print('Error: no existe un curso con el código $codigo.');
    return;
  }

  print('1. Nombre');
  print('2. Docente');
  print('3. Cupo máximo');
  int opcion = leerEntero('¿Qué desea modificar? ', 1);

  switch (opcion) {
    case 1:
      curso.nombre = leerTexto('Nuevo nombre: ');
      print('Nombre actualizado.');
      break;
    case 2:
      curso.docente = leerTexto('Nuevo docente: ');
      print('Docente actualizado.');
      break;
    case 3:
      int minimo = curso.estudiantes.length;
      if (minimo < cupoMinimo) {
        minimo = cupoMinimo;
      }
      curso.cupoMaximo = leerEntero('Nuevo cupo máximo: ', minimo);
      print('Cupo actualizado.');
      break;
    default:
      print('Opción no válida.');
  }
}