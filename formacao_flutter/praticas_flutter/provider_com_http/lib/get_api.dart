import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Cadastro>> getCadastros() async {
  final response = await http.get(
    Uri.parse("https://jsonplaceholder.typicode.com/posts"),
  );

  if (response.statusCode == 200) {
    final List dados = json.decode(response.body);
    return dados.map((json) => Cadastro.fromJson(json)).toList();
  } else {
    throw Exception("Erro ao carregar os dados");
  }
}

class Cadastro {
  final int id;
  final String title;
  final String body;

  Cadastro({required this.id, required this.title, required this.body});

  factory Cadastro.fromJson(Map<String, dynamic> json) {
    return Cadastro(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
