import 'package:lista_de_contatos/controller/database.dart';
import 'package:lista_de_contatos/model/pessoa.dart';
import 'package:flutter/material.dart';

class PessoaState extends ChangeNotifier {
  PessoaState() {
    load();
  }

  final controller = PessoaController();

  final _listaPessoa = <Pessoa>[];

  List<Pessoa> get listaPessoa => _listaPessoa;

  Future<void> add(Pessoa p) async {
    // PEGA O ID GERADO!
    int id = await controller.insert(p);

    final pessoa = Pessoa(id: id, nome: p.nome);

    _listaPessoa.add(pessoa);
    print("ADICIONOU PESSOA: ${pessoa.nome} COM ID: ${pessoa.id}");

    notifyListeners();
  }

  Future<void> load() async {
    print("CARREGANDO LISTA DE PESSOAS");

    final lista = await controller.select();

    _listaPessoa.clear();
    _listaPessoa.addAll(lista);

    print("LISTA CARREGADA COM ${_listaPessoa.length} PESSOAS");

    notifyListeners();
  }
}
