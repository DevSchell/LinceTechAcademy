import 'dart:math';

void main() {
  //Inicializando listas
  List<int> lista1 = [];
  List<int> lista2 = [];
  List<String> acoesRealizadas = [];
  List<int> resultadoLista = [];

  //Povoando listas
  while (lista1.length < 5) {
    lista1.add(Random().nextInt(100));
  }
  while (lista2.length < 5) {
    lista2.add(Random().nextInt(100));
  }

  //Requisito 1 -> Função que recebe 1 lista como parâmentro e printa ela
  void imprimirLista(List lista) {
    print("Lista: $lista");
  }

  List? somarListas(List lista1, List lista2) {
    if (lista1.length != lista2.length) {
      print("Listas com número de posições diferente!");
    } else {
      for (var i = 0; i < lista1.length; i++) {
        resultadoLista.add(lista1[i] + lista2[i]);
        acoesRealizadas.add("${lista1[i]} + " + "${lista2[i]}");
      }
      return resultadoLista;
    }
  }

  imprimirLista(lista1);
  imprimirLista(lista2);
  somarListas(lista1, lista2);
  print(acoesRealizadas);
  imprimirLista(resultadoLista);
}
