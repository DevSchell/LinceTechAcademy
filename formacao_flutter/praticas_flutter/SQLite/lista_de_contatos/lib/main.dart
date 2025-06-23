import 'package:flutter/material.dart';
import 'package:lista_de_contatos/provider/pessoaState.dart';
import 'package:lista_de_contatos/view/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => PessoaState(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Contatos',
      debugShowCheckedModeBanner: false,
      routes: {'/': (context) => Home()},
    );
  }
}
