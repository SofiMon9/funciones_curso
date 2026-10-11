class Curso {
  String codigo;
  String nombre;
  String docente;
  int cupoMaximo;
  Set<String> estudiantes = <String>{};

  Curso(this.codigo, this.nombre, this.docente, this.cupoMaximo);
}
