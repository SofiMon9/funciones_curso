import 'curso.dart';

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