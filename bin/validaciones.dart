import 'dart:io';

String leerTexto(String mensaje) {
  while (true) {
    stdout.write(mensaje);
    String entrada = (stdin.readLineSync() ?? '').trim();

    if (entrada.isEmpty) {
      print('Error: este campo no puede estar vacío.');
    } else {
      return entrada;
    }
  }
}