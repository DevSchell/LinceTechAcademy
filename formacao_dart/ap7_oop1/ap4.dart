import 'dart:math';

void main() {
  //Criando valores que vou usar depois
  final random = Random();
  double min = 1.0;
  double max = 2.3;

  //Criando objeto "Pessoa"
  Pessoa p = new Pessoa("John Doe"); //Famoso John Doe

  //Usando setters
  p.idade = random.nextInt(100) + 1;
  p.altura = min + (random.nextDouble() * (max - min));

  //Usando os getters
  print("Nome: ${p.nome}");
  print("Idade: ${p.idade}");
  print("Altura: ${p.altura.toStringAsFixed(2)}"); //Tratamento pra saída da altura ficar com 2 cadas decimais

}

class Pessoa {
  late final String _nome;
  late final int _idade;
  late final double _altura;

  Pessoa(this._nome); //Usando o construtor pra pegar apenas o nome do objeto

  //Getters
  String get nome => _nome;
  int get idade => _idade;
  double get altura => _altura;

  //Setters
  set idade(int idade) {
    if (idade >= 0) {
      _idade = idade;
    }
  }

  set altura(double altura) {
    if(altura <= 2.3 && altura >= 1.0) {
      _altura = altura;
    }
  }

}
