import 'dart:math';

void main() {
  //Criando lista vaiza
  List<int> lista = [];

  //Adicionando valores aleatórios à lista
  lista.add(Random().nextInt(100));
  lista.add(Random().nextInt(100));
  lista.add(Random().nextInt(100));
  lista.add(Random().nextInt(100));
  lista.add(Random().nextInt(100));
  lista.add(Random().nextInt(100));
  lista.add(Random().nextInt(100));
  lista.add(Random().nextInt(100));
  lista.add(Random().nextInt(100));
  lista.add(Random().nextInt(100));

  //Printando conforme o requisitado
  print("Posição 1: ${lista[0]}");
  print("Posição 2: ${lista[1]}");
  print("Posição 3: ${lista[2]}");
  print("Posição 4: ${lista[3]}");
  print("Posição 5: ${lista[4]}");
  print("Posição 6: ${lista[5]}");
  print("Posição 7: ${lista[6]}");
  print("Posição 8: ${lista[7]}");
  print("Posição 9: ${lista[8]}");
  print("Posição 10: ${lista[9]}");

  //Print da lista inteira para testes de index
  print("Lista completa: $lista");
}