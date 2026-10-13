import 'curso.dart';
import 'validaciones.dart';

const int cupoMinimo = 1;

List<Curso> cursos = [];

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

  if (buscarPorCodigo(codigo) != null) {
    print('Error: ya existe un curso con el código $codigo.');
    return;
  }

  String nombre = leerTexto('Nombre del curso: ');
  String docente = leerTexto('Docente: ');
  int cupo = leerEntero('Cupo máximo de estudiantes: ', cupoMinimo);

  Curso nuevo = Curso(codigo, nombre, docente, cupo);
  cursos.add(nuevo);
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