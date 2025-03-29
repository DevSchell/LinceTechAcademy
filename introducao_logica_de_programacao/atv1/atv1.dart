import 'dart:math';

void main() {
  
  //Gerando variáveis aleatórias para simular entrada de dados do usuário
  int numA = Random().nextInt(100);
  int numB = Random().nextInt(100);
  double? resultado;

  //Análise se numA ou numB é maior
  if (numA > numB) {
    resultado = numA / numB;
  } else {
    resultado = numB / numA;
  }

  //Printando resultado final
  print("Resultado da divisão: $resultado");
}
