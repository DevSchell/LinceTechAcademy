Future<void> main() async {
  List<String> urls = [
    'https://example.com/imagem1.jpg',
    'https://example.com/imagem2.jpg',
    'https://example.com/imagem3.jpg',
  ];

  await baixarImagens(urls);
}

//Essa função baixa imagens 1 por vez
Future<void> baixarImagem(String url) async {
  await Future.delayed(Duration(seconds: 2));

  print("Imagem $url baixada com sucesso!");
}

//Essa função é a que está sendo chamada na main()
//Ela chama a função acima e espera ela ser finalizada pra cada item na lista "urls"
Future<void> baixarImagens(List<String> urls) async {
  print("Baixando imagens...");

  for (String url in urls) {
    await baixarImagem(url);
  }

  print("Download concluído com sucesso!");
}

