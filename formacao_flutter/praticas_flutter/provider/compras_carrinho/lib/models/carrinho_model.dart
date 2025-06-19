import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Carrinho extends ChangeNotifier {
  List<Produto> _listaProdutos = [];

  List<Produto> get listaProdutos => _listaProdutos;

  void addProduto(Produto produto){
    _listaProdutos.add(produto);
    notifyListeners();
  }

  void deleteProduto(Produto produto){
    _listaProdutos.remove(produto);
    notifyListeners();
  }

}

class Produto {
  final String id;
  final String nome;
  final String imagemUrl;
  final double preco;

  Produto({
    required this.id,
    required this.nome,
    required this.imagemUrl,
    required this.preco,
  });
}
