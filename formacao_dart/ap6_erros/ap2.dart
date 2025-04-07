import 'dart:math';

void main() {
  int teste = Random().nextInt(100); //Simulando entradas aleatórias do usuário
  print("Número teste: $teste");

  try {
    funcaoPares(teste);
  } catch (e) {
    print(e);
  }
}

void funcaoPares(int numero) {
  if (numero % 2 == 0) { //Analisa se é par ou ímpar o valor
    print("Entrada correta, você inseriu um número par");
  } else {
    throw Exception("Entrada inválida. Insira apenas números pares.");
  }
}
