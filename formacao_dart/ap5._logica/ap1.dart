import 'dart:math';

void main() {
  //Simulando entrada aleatória do usuário 
  int valor = Random().nextInt(100);

  //Chama a função, passando o parâmetro que o usuário informou na var "valor"
  print(listaImpares(valor));
}

//Função que retorna ímpares e usa valor do usuário como limitador do loop
List<int> listaImpares(int limitador) {
  List<int> lista = [];
  for (var i = 0; i <= limitador; i++) {
    if (i % 2 != 0) {
      lista.add(i);
    }
  }
  return lista;
}
