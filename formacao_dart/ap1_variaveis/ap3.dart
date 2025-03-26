import 'dart:math';

void main() {

  //Criando variáveis aleatórias
  int aleatorioA = Random().nextInt(100);
  int aleatorioB = Random().nextInt(100);

  //Printando as variáveis
  print("Valor A: $aleatorioA");
  print("Valor B: $aleatorioB");

  //Invertendo variáveis
  final int numStore = aleatorioA; //Variável numStore guarda um dos valores pro mesmo não se perder no código
  aleatorioA = aleatorioB;
  aleatorioB = numStore;

  //Printando as variáveis invertidas
  print("Valor A: $aleatorioA");
  print("Valor B: $aleatorioB");

}