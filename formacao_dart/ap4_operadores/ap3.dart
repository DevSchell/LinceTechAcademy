void main() {
  List<String> listaLinguagens = ["Java", "Dart", "C#", "JavaScript"];

  print(listaLinguagens);
  print(removerDaLista(lista: listaLinguagens, parametro: "Java"));
}

// Requisito 1: Criar função que recebe lista e 1 parâmentro, ela remove o parâmetro de dentro da lista
List<String> removerDaLista({List<String>? lista, String? parametro}) { //Requisito 2: Lista e parâmetro podem ser nulos
  lista?.remove(parametro);
  return lista ?? []; //Requisitos 3 e 4: O retorno não pode ser nulo e o retorno tem que ser a lista modificada, tratando os casos de null 
}
