void main() {

  String? idadeStatus, ativoStatus, nacionalidadeStatus; //Variáveis pra uso futuro nas validações

  final pessoa = Pessoa(); // Criação do objeto pessoa
  
  if(pessoa.idade > 18) {
    idadeStatus = "Maior de idade";
  } else {
    idadeStatus = "Menor de idade";
  }

  //Análises de dados
  if (pessoa.ativo) {
    ativoStatus = "Ativo";
  } else {
    ativoStatus = "Inativo";
  }

  if (pessoa.nacionalidade == null) {
    nacionalidadeStatus = "Não informado";
  } else {
    nacionalidadeStatus = pessoa.nacionalidade;
  }

  //Printando saídas
  print("Nome completo: ${pessoa.nome.toString()} ${pessoa.sobrenome.toString()}");
  print("Idade: ${pessoa.idade.toString()} $idadeStatus");
  print("Situação: $ativoStatus");
  print("Peso: ${pessoa.peso.toString()} kg");
  print("Nacionalidade: $nacionalidadeStatus");

}

class Pessoa {
  String nome = "Leonardo";
  String sobrenome = "Schell";
  int idade = 22;
  bool ativo = true;
  double peso = 109.5;
  String nacionalidade = "Brasileiro";
}