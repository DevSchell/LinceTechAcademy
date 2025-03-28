import 'dart:math';

void main() {
  List<int> lista = [];
  Set<int> comparador = {}; //Lembrar que Sets sempre usamos chaves e listas colchetes

  //Povoando a lista com números entre 10 e 21
  while (lista.length < 50) {
    lista.add(Random().nextInt(10) + 11);
  }

  print("Lista original: $lista");

  //Remove números repetidos com base na condição do método removeWhere()
  lista.removeWhere((numero) {
    if (comparador.contains(numero)) {
      return true;
    } else {
      comparador.add(numero);
      return false;
    }
  });

  print("Lista atualizada: $lista");
}