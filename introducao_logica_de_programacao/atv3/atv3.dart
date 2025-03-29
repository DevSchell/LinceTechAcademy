import 'dart:math';

void main() {
  //Simulando entradas de dados do usuário
  int numA = Random().nextInt(100);
  int numB = Random().nextInt(100);
  int? resultadoAbs;

  //Analisando qual variável é maior, já que estamos buscando o resultado absoluto
  if (numA > numB) {
    resultadoAbs = numA - numB;
  } else {
    resultadoAbs = numB - numA;
  }

  //Imprimindo o resultado absoluto
  print("Resultado absoluto é: $resultadoAbs");
}
