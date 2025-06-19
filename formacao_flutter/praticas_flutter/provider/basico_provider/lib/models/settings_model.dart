import 'package:flutter/material.dart';

class Settings extends ChangeNotifier {
  String _name = "nenhum";
  int _age = 0;
  bool isDark = false;

  set name(String newName) {
    _name = newName;
    notifyListeners(); //Essa função vai avisar pra todos que estão escutando que o nome foi alterado
  }

  String get name => _name;

  set age(int newAge) {
    _age = newAge;
    notifyListeners();
  }

  int get age => _age;

  void switchTheme() {
    isDark = !isDark;
    notifyListeners();
  }

}
