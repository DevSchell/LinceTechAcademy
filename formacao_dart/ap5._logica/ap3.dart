import 'dart:math';

void main() {
  //Simulando valor do usuário
  int valor = Random().nextInt(901) + 100;

  print("A soma dos números pares entre 0 e $valor é ${somarPares(valor)}");
}

//Função requisitada
int somarPares(int limitador) {
  int resultado = 0;

  for (var i = 0; i <= limitador; i++) {
    if (i % 2 == 0) {
      resultado += i; //resultado vai se incrementando sempre que condição é true
    }
  }

  return resultado;
}
