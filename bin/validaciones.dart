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

int leerEntero(String mensaje, int minimo) {
  while (true) {
    stdout.write(mensaje);
    String entrada = (stdin.readLineSync() ?? '').trim();
    int? numero = int.tryParse(entrada);

    if (numero == null) {
      print('Error: debe escribir un número entero.');
    } else if (numero < minimo) {
      print('Error: el número debe ser mayor o igual a $minimo.');
    } else {
      return numero;
    }
  }
}