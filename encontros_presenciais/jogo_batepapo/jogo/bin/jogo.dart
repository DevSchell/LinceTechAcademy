import 'package:jogo/jogo.dart' as jogo;
import 'dart:convert';
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  //TODO: LOGIN
  var jsonLogin = await requisicaoLogin();
  final mapJson = jsonDecode(jsonLogin.body) as Map<String, dynamic>;

  Pessoa pessoa = Pessoa(
    token: mapJson['token'],
    nome: mapJson['usuario']['nome'],
    senha: mapJson['usuario']['login'],
  );

  // print("Prints LOGIN");
  // print("_____________");
  // print(pessoa.nome);
  // print(pessoa.senha);
  // print(pessoa.token);
  // print("_____________");

  //TODO: LISTAR SALAS
  var jsonListarSalas = await requisicaoListarSalas(pessoa);
  final mapListarSalas = jsonDecode(jsonListarSalas.body);

  // for(var sala in mapListarSalas) {
  //   print('-----------------');
  //   print("Código: ${sala['codigo']}");
  //   print("Nome: ${sala['nome']}");
  //   print("Vagas: ${sala['vagas']}");
  //   print("Admin: ${sala['administrador']}");
  //   print("Participantes: ${sala['participantes']}");
  //   print("Mensagens: ${sala['mensagens']}");
  // }

  //TODO: CRIAR SALAS
  // var jsonCriarSala = await requisicaoCriarSala("teste_schell", 1, pessoa);
  // final mapCriarSala = jsonDecode(jsonCriarSala.body);
  // Sala sala = Sala(
  //   codigo: mapCriarSala['codigo'],
  //   nome: mapCriarSala['nome'],
  //   vagas: mapCriarSala['vagas'],
  // );
  // print("Código da sala: ${sala.codigo}");

  //TODO: EDITAR SALA
  // var jsonEditarSala = await requisicaoEditarSala(
  //   sala.codigo,
  //   'teste_2',
  //   2,
  //   pessoa
  // );
  // final mapEditarSala = jsonDecode(jsonEditarSala.body);
  // print("Sala do código: ${mapEditarSala['codigo']}");
  // print("Novo nome: ${mapEditarSala['nome']}");
  // print("Novo num de vagas: ${mapEditarSala['vagas']}");

  //TODO: ENTRAR EM SALA - Por enquanto é uma sala fixa (396df0ce-e428-422c-8c75-e6999c911fbc)
  //var jsonEntrarEmSala = await requisicaoEntrarEmSala(pessoa);
  // final mapEntrarEmSala = jsonDecode(jsonEntrarEmSala.body);

  //TODO: DELETAR SALA - WIP - Hardcoded
  //var jsonApagarSala = await requisicaoApagarSala(pessoa);

  //TODO: SAIR DA SALA - WIP - Hardcoded
  //var jsonSairDaSala = await requisicaoSairDaSala(pessoa);

  //TODO: CARREGAR DADOS - WIP - Hardcoded
  var jsonCarregarDados = await requisicaoCarregarDados(pessoa);
  final mapCarregarDados = jsonDecode(jsonCarregarDados.body);
  print(mapCarregarDados['mensagens']);

  //TODO: ENVIAR MENSAGEM P/ SALA - Hardcoded
  var jsonEnviarMensagem = await requisicaoEnviarMensagem(pessoa);
}

Future<http.Response> requisicaoEnviarMensagem(Pessoa p) {
  final url = 'https://cruiserdev.lince.com.br/sala/mensagem/396df0ce-e428-422c-8c75-e6999c911fbc';

  final response = http.post(Uri.parse(url),
    headers: <String, String> {
      'Authorization' : p.token,
      'Content-Type' : 'application/json'
    },
    body: jsonEncode(<String,String> {
    'mensagem' : 'Olá mundo'
    })
  );

  return response;
}

Future<http.Response> requisicaoCarregarDados(Pessoa p) {
  final url = 'https://cruiserdev.lince.com.br/sala/396df0ce-e428-422c-8c75-e6999c911fbc';

  final response = http.get(Uri.parse(url),
    headers: <String,String> {
      'Authorization' : p.token
    }
    ,);

  return response;
}

Future<http.Response> requisicaoSairDaSala(Pessoa pessoa) {
  final url = 'https://cruiserdev.lince.com.br/sala/sair/396df0ce-e428-422c-8c75-e6999c911fbc';

  final response = http.post(Uri.parse(url),
    headers: <String, String> {
      'Authorization' : pessoa.token
    });
  return response;
}

Future<http.Response> requisicaoApagarSala(Pessoa p) {
  final url = 'https://cruiserdev.lince.com.br/sala/4008bebe-86f8-4d66-81b0-ff98aa02019d';

  final response = http.delete(Uri.parse(url),
    headers: <String, String> {
      'Authorization' : p.token
    }
  );

  return response;
}

Future<http.Response> requisicaoEntrarEmSala(Pessoa pessoa) {
  final url = 'https://cruiserdev.lince.com.br/sala/entrar/396df0ce-e428-422c-8c75-e6999c911fbc';

  final response = http.post(Uri.parse(url),
    headers: <String, String>{
    'Authorization' : pessoa.token
    }
  );

  return response;
}

Future<http.Response> requisicaoEditarSala(String codigo,
    String nome,
    int vagas,
    Pessoa pessoa) {
  final url = 'https://cruiserdev.lince.com.br/sala';

  final response = http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': pessoa.token,
    },
    body: jsonEncode(<String, dynamic>{
      'codigo': codigo,
      'nome': nome,
      'vagas': vagas,
    }),
  );

  return response;
}

Future<http.Response> requisicaoCriarSala(String nome, int vagas, Pessoa pessoa) async {
  var url = 'https://cruiserdev.lince.com.br/sala';

  final response = http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': pessoa.token,
    },
    body: jsonEncode(<String, dynamic>{'nome': nome, 'vagas': vagas}),
  );

  return response;
}

Future<http.Response> requisicaoListarSalas(Pessoa pessoa) async {
  var url = 'https://cruiserdev.lince.com.br/salas';

  final response = http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Authorization': pessoa.token,
    },
  );

  return response;
}

Future<http.Response> requisicaoLogin() async {
  var url = "https://cruiserdev.lince.com.br/login";

  final response = http.post(
    Uri.parse(url),
    headers: <String, String>{'Content-type': 'application/json'},
    body: jsonEncode(<String, String>{'login': 'leonardo', 'senha': 'leXo'}),
  );

  return response;
}

class Sala {
  String codigo;
  String nome;
  int vagas;

  Sala({required this.codigo, required this.nome, required this.vagas});
}

class Pessoa {
  String token;
  String nome;
  String senha;

  Pessoa({required this.token, required this.nome, required this.senha});
}
