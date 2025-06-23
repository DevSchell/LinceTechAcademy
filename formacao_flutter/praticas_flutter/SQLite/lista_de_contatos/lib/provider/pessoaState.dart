import 'package:lista_de_contatos/controller/database.dart';
import 'package:lista_de_contatos/model/pessoa.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PessoaState extends ChangeNotifier {
  final controller = PessoaController();
  final _controllerNome = TextEditingController();

  TextEditingController get controllerNome => _controllerNome;

  Future<void> insert() async {
    final pessoa = Pessoa(
      nome: controllerNome.text
    );

    await controller.insert(pessoa);

    notifyListeners();
  }
}