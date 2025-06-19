import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CadastroState with ChangeNotifier {
  List<Cadastro> _listaCadastros = [];

  List<Cadastro> get listaCadastros => _listaCadastros;

  void addCadastro(Cadastro cadastro) {
    _listaCadastros.add(cadastro);
    notifyListeners();
  }

  void deleteCadastro(Cadastro cadastro) {
    _listaCadastros.remove(cadastro);
    notifyListeners();
  }

}

class Cadastro {
  String nome;
  String telefone;

  Cadastro({
    required this.nome,
    required this.telefone
});
}