class Curso {
  String codigo;
  String nombre;
  String docente;
  int cupoMaximo;
  Set<String> estudiantes = <String>{};

  Curso(this.codigo, this.nombre, this.docente, this.cupoMaximo);

    int cuposDisponibles() {
    return cupoMaximo - estudiantes.length;
  }

  bool hayCupo() {
    return cuposDisponibles() > 0;
  }

  bool inscribirEstudiante(String nombreEstudiante) {
    return estudiantes.add(nombreEstudiante);
  }

  void mostrarInformacion() {
    print('Código: $codigo');
    print('Nombre: $nombre');
    print('Docente: $docente');
    print('Cupo: ${estudiantes.length}/$cupoMaximo');
    if (estudiantes.isEmpty) {
      print('Estudiantes: (ninguno)');
    } else {
      print('Estudiantes: ${estudiantes.join(', ')}');
    }
    print('-----------------------------');
  }
}
