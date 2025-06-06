import 'package:flutter/material.dart';

class Tarefas extends ChangeNotifier{
  List<String> listaTarefas = [];

  void addTarefa (String todo) {
    listaTarefas.add(todo);
    notifyListeners();
  }

  void deleteTarefa(String todo) {
    listaTarefas.remove(todo);
    notifyListeners();
  }
}