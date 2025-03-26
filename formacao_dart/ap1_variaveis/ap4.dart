import 'dart:math';

void main() {
  
  //Criando variáveis aleatórias
  int numA = Random().nextInt(100);
  int numB = Random().nextInt(100);

  //Validação necessária - Eu sofri o erro "Infinity", que acontece quando o numB resulta em 0. Tem que garantir que não seja 0
  while (numB == 0) {
    numB = Random().nextInt(100); //Aqui a gente faz ele gerar novamente
  }

  //Processos
  double resultado = numA / numB;
  int parteInteira = numA ~/ numB; //Esse operador faz a divisão e mantém a parte inteira, apenas
  double parteDecimal = resultado - parteInteira;
  
  //Printando variáveis
  print("Resultado compelto: $resultado");
  print("Parte Inteira: $parteInteira");
  print("Parte Decimal: $parteDecimal");

}