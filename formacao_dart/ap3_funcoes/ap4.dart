import 'dart:math';

void main() {

  //Criando lista
  List<int> temperaturas = [];

  //Simulando software povoando lista com dados de um sensor de temperatura
  while (temperaturas.length < 15) {
    temperaturas.add(Random().nextInt(5000));
  }

  //Funções para conversão

  String converterBinario(int num) {
    return num.toRadixString(2); //Método descoberto pra conversão de bases numéricas
  }

  String converterHexadecimal(int num) {
    return num.toRadixString(16);
  }

  String converterOctal(int num) {
    return num.toRadixString(8);
  }

  temperaturas.sort(); //Organiza em ordem crescente os valores
  for (var element in temperaturas) { //O for percorre a lista e a cada valor, informa a temperatura em diferentes bases numéricas
    print(
      "decimal: ${element}, binário: ${converterBinario(element)}, octal: ${converterOctal(element)}, hexadecimal: ${converterHexadecimal(element)}",
    );
  }
}
