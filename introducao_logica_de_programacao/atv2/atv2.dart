import 'dart:math';

void main() {
  //Criando lista
  List<int> lista = [];

  //Simulando as entradas do usuário
  while (lista.length < 4) {
    lista.add(Random().nextInt(100));
  }

  print(lista);
  //For vai percorrer a lista fazendo a análise, para todo número ímpar, ele printará a mensagem...
  for (var element in lista) {
    if (element % 2 != 0) {
      print("Número $element é ímpar!");
    }
  }
}
