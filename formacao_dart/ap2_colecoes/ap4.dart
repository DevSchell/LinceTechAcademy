void main() {
  //Criando os valores de cada chave do mapa
  List<String> cidadesMG = ["Belo Horizonte", "Berlinda", "Juiz de Fora"];
  List<String> cidadesPR = ["Cascavel", "Curitiba", "Foz do Iguaçu"];
  List<String> cidadesSC = [
    "Gaspar",
    "Florianópolis",
    "Blumenau",
  ]; // Fora de ordem alfabética, pois vou testar o método Sort() com strings...
  List<String> cidadesSP = ["Campinas", "Guaruhos", "São Paulo"];

  //Criando o mapa organizado já por chave e ordem alfabética
  Map<String, List> mapa = {
    "MG": cidadesMG,
    "PR": cidadesPR,
    "SC": cidadesSC,
    "SP": cidadesSP,
  };

  // Requisito 1: Imprimir siglas dos estados
  print("Estados: ${mapa.keys.toString()}");

  // Requisito 2: Imprimir todas as cidades da chave SC em ordem alfabética
  mapa["SC"]?.sort();
  print(mapa["SC"]);

  // Requisito 3: Imprimir todas as cidades em ordem alfabética
  List<String> chaves = mapa.keys.toList();
  chaves.sort();
  for (var i = 0; i < chaves.length; i++) {
    print("Estado ${chaves[i]}");
    print("Cidades: ${mapa[chaves[i]]}");
  }
}
