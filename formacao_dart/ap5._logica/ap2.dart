import 'dart:math';

void main() {
  //Criando 5 entradas aleatórias até 26
  int numA = Random().nextInt(26);
  int numB = Random().nextInt(26);
  int numC = Random().nextInt(26);
  int numD = Random().nextInt(26);
  int numE = Random().nextInt(26);

  //Printando saídas conforme requisitado
  print("Número $numA -> Letra ${letraAlfabeto(numA)}");
  print("Número $numB -> Letra ${letraAlfabeto(numB)}");
  print("Número $numC -> Letra ${letraAlfabeto(numC)}");
  print("Número $numD -> Letra ${letraAlfabeto(numD)}");
  print("Número $numE -> Letra ${letraAlfabeto(numE)}");
}

//Função requisitada
String letraAlfabeto(int index) {
  List<String> alfabeto = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "X",
    "Y",
    "Z",
  ];

  String letra = "";

  for (var i = 0; i < alfabeto.length; i++) { 
    if (i == index - 1) { //index - 1 pensando em compensar a lógica de posições de uma lista, onde 0 é o primeiro elemento e assim por diante
      letra = alfabeto[i];
      break; // Assim que achar a letra referente ao número, quebra o loop e continua o bloco de código
    }
  }
  return letra;
}
