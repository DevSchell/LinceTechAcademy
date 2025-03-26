void main() {
  String? idadeStatus, ativoStatus, nacionalidadeStatus;

  //Criando variáveis
  String nome = "Leonardo";
  String sobrenome = "Schell";
  int idade = 22;
  bool ativo = true;
  double peso = 109.5;
  String nacionalidade = "Brasileiro";

  if(idade > 18) {
    idadeStatus = "Maior de idade";
  } else {
    idadeStatus = "Menor de idade";
  }

  if (ativo) {
    ativoStatus = "Ativo";
  } else {
    ativoStatus = "Inativo";
  }

  if (nacionalidade == null) {
    nacionalidadeStatus = "Não informado";
  } else {
    nacionalidadeStatus = nacionalidade;
  }

  //Saída de Dados
  print("Nome completo: $nome $sobrenome");
  print("Idade: $idade $idadeStatus");
  print("Situação: $ativoStatus");
  print("Peso: $peso kg");
  print("Nacionalidade: $nacionalidadeStatus");
}