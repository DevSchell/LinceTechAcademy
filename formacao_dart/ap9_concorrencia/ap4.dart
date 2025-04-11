void main() {

  buscarDados("John Doe");
  
}

Future<String> buscarDados(String nome) async {
  print("Iniciando busca do nome $nome");
  await Future.delayed(Duration(seconds: 2));
  print("Busca em 10%");
  await Future.delayed(Duration(seconds: 2));
  print("Busca em 36%");
  await Future.delayed(Duration(seconds: 2));
  print("Busca em 67%");
  await Future.delayed(Duration(seconds: 2));
  print("Busca em 88%");
  await Future.delayed(Duration(seconds: 2));
  print("Busca concluída!");
  return "$nome está na lista!";
}

