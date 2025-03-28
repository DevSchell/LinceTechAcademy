import 'dart:math';

void main() {
  //Criando lista
  List<int> lista = [];

  //Povoando a lista com 50 valores aleatórios
  while (lista.length < 50) {
    lista.add(Random().nextInt(15));
  }

  //Imprimindo a lista original
  print("Lista original: $lista");

  //Removendo todos os valores pares
  lista.removeWhere((numero) => numero % 2 == 0);

  //Imprimindo a lista atualizada
  print("Lista atualizada: $lista");
}