import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Produto>> getProdutos() async {
  print("Chamgou getProdutos");
  final response = await http.get(Uri.parse("https://dontpad.com/json-loja"));

  if(response.statusCode == 200){
    final decoded1 = json.decode(response.body); //Por estar dentro de dontPad, ele não vem em JSON puro, e sim uma String. Tem que dar decode 2 vezes
    final decoded2 = json.decode(decoded1["text"]);
    final List<Produto> produtos = decoded2.map<Produto>((e) => Produto.fromJson(e)).toList();
    print(decoded2);
    return produtos; //Retorna lista de objetos da classe 'Produto'

  } else {
    throw Exception("Erro ao carregar dados da API");
  }

}

class Produto {
  int id;
  String nome;
  double preco;
  int quantidadeEstoque;

  Produto({
    required this.id,
    required this.nome,
    required this.preco,
    required this.quantidadeEstoque,
});

  factory Produto.fromJson(Map<String, dynamic> json){
    return Produto(
      id: json['id'],
      nome: json['nome'],
      preco: (json["preco"] as num).toDouble(),
      quantidadeEstoque: json['quantidade'],
    );
  }
}