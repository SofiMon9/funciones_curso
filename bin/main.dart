import 'validaciones.dart';

const String titulo = 'SISTEMA DE GESTIÓN DE CURSOS Y ESTUDIANTES';

void mostrarMenu() {
  print('\n$titulo');
  print('-----------------------------');
  print('1. Registrar curso');
  print('2. Consultar todos');
  print('3. Buscar por nombre');
  print('4. Modificar');
  print('5. Eliminar');
  print('6. Mostrar resumen');
  print('7. Inscribir estudiante');
  print('0. Salir');
  print('-----------------------------');
}

void main() {
  bool continuar = true;

  while (continuar) {
    mostrarMenu();
    int opcion = leerEntero('Seleccione una opción: ', 0);

    switch (opcion) {
      case 0:
        print('Gracias por usar el sistema. ¡Hasta pronto!');
        continuar = false;
        break;
      default:
        print('Opción no disponible todavía.');
    }
  }
}