void main() async {
  print('Iniciando lançamento');

  await lancarFoguete();

  print('Foguete lançado!');
}

Future<void> lancarFoguete() async {

  for (int i = 10; i > 0; i--){
    print("Contagem: $i");
    await Future.delayed(Duration(seconds: 1)); //Importante o await ficar no Future.delayed
  }

}