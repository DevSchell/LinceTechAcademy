import 'dart:math';

void main() {
  int resultado1, resultado2;

  //Função A, que executa outra função 2x, passando números aleatórios
  int a(Function funcao) {
    resultado1 = funcao(Random().nextInt(10));
    resultado2 = funcao(Random().nextInt(10));

    return resultado1 + resultado2;
  }

  //Função B, que soma número com ele mesmo
  int b(int numero) {
    return numero + numero;
  }

  //Função C, que multiplica um número por ele mesmo
  int c(int numero) {
    return numero * numero;
  }

  //Executção à partir do requisito 7.
  print("Função AB: ${a(b)}");
  print("Função AC: ${a(c)}");
}
