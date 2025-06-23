import 'package:flutter/material.dart';
import 'package:lista_de_contatos/view/home.dart';

void main() {
  runApp(MyApp());
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
