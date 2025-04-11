import 'dart:math';

void main() {
  int valor = Random().nextInt(100);
  print("O dobro do número $valor é: ${Calculadora.dobro(valor)}");
}

abstract class Calculadora {
  static dobro(int numero) => numero * 2; 
}