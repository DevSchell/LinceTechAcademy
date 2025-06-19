import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'get_api.dart';

class ProdutosProvider with ChangeNotifier {
  List<Produto> _produtos = [];
  bool _isLoading = false;
  String? _erro;

  List<Produto> get produtos => _produtos;
  bool get isLoading => _isLoading;
  String? get erro => _erro;

  Future<void> carregarProdutos() async {
    print("Chamou o método 'carregarProdutos()'");
    _isLoading = true;
    notifyListeners();

    try {
      _produtos = await getProdutos();
      print("Produtos carregados: ${_produtos.length}");
      _erro = null;
    } on Exception catch (e) {
      _erro = "Houve um erro ao carregar os produtos da API: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

}