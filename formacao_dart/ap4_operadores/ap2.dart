void main() {
  List<String> listaOriginal = [
    "10",
    "2XXL7",
    "JOJ0",
    "99",
    "381",
    "AD44",
    "47",
    "2B",
    "123",
    "78",
  ];
  converterLista(listaOriginal);
}

List<int> converterLista(List<String> lista) {
  //Tirar o ? depois...
  List<int> listaConvertida = [];
  for (var element in lista) {
    listaConvertida.add(int.tryParse(element) ?? 0);
  }
  print(listaConvertida);
  return listaConvertida;
}
