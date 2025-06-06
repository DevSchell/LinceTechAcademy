import 'package:flutter/cupertino.dart';
import 'get_api.dart';
import 'package:provider/provider.dart';

class CadastroProvider with ChangeNotifier {
  List<Cadastro> _cadastros = [];
  bool _isLoading = false;
  String? _erro;


  List<Cadastro> get cadastros => _cadastros;
  bool get isLoading => _isLoading;
  String? get erro => _erro;


  Future<void> loadCadastros() async {
    _isLoading = true;
    notifyListeners();

    try {
      _cadastros = await getCadastros();
      _erro = null;

    }  catch (e) {
      _erro = "Erro ao buscar dados: $e";
    }

    _isLoading = false;
    notifyListeners();
  }

  void LimparCadastros() {
    _cadastros = [];
    notifyListeners();
  }

  void deleteCadastro(Cadastro cadastro) {
    _cadastros.remove(cadastro);
    notifyListeners();
  }

}