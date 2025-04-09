import 'dart:math';

void main() {
  //Criando lista de produtos
  List<Produto> produtos = [];
  double valorDesconto = 25;

  //Criando objetos
  Produto p1 = new Produto("Pão", 20);
  Produto p2 = new Produto("Arroz", 37.79);
  Produto p3 = new Produto("Azeite", 51.49);
  Produto p4 = new Produto("Achocolatado", 14.78);
  Produto p5 = new Produto("Couve-flor", 13.80);
  Produto p6 = new Produto("Azeitona", 15.69);

  //Adicionando objetos à lista
  produtos.add(p1);
  produtos.add(p2);
  produtos.add(p3);
  produtos.add(p4);
  produtos.add(p5);

  for (var item in produtos) {
    print("Novo preço do produto ${item._nome} (com desconto): ${item.calcularDesconto(valorDesconto).toStringAsFixed(2)}"); //Função maravilhosa de arredondar valores p 2 casas decimais
  }


}
//Criando classe "Produto"
class Produto {
  late final _nome;
  late final _preco;
  //Construtor
  Produto(String nome, double preco){
    this._nome = nome;
    this._preco = preco;
  }
  //Method "calcularDesconto"
  double calcularDesconto(double percentual) {
    if(percentual > 100) {
      throw Exception("O desconto é maior do que o preço cheio do produto! Tente novamente com um valor menor");
    }
    double desconto = (percentual / 100) * _preco;
    return  _preco - desconto;
  }
}