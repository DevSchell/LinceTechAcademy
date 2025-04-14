import 'dart:math';

void main() {
  //Base de dados - nomes
  List<String> nomes = ["Ana", "Francisco", "Joao", "Pedro", "Gabriel", "Rafaela", "Marcio", "Jose", "Carlos", "Patricia", "Helena", "Camila", "Mateus", "Gabriel",
    "Maria", "Samuel", "Karina", "Antonio", "Daniel", "Joel", "Cristiana", "Sebastião", "Paula"];
  //Base de dados - sobrenomes
  List<String> sobrenomes = ["Silva", "Ferreira", "Almeida", "Azevedo", "Braga", "Barros", "Campos", "Cardoso", "Teixeira", "Costa", "Santos",
    "Rodrigues", "Souza", "Alves", "Pereira", "Lima", "Gomes", "Ribeiro", "Carvalho", "Lopes", "Barbosa"];

  //chamando função que gera o nome
  gerarNome(nomes, sobrenomes);
}

//Função que gera o nome
void gerarNome(List<String> nomes, List<String> sobrenomes){
  int nomeIndex = Random().nextInt(nomes.length);
  int sobrenomeIndex = Random().nextInt(sobrenomes.length);
  print("Nome: ${nomes[nomeIndex]} ${sobrenomes[sobrenomeIndex]}");
}