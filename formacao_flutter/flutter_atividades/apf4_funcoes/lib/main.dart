import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

List<Color> cores = [Colors.green, Colors.red, Colors.blue, Colors.yellow, Colors.purple];
List<String> listaCores = ['verde', 'vermelho', 'azul', 'amarelo', 'roxo'];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Atv1 - Lista de Cores"),
        ),
        body: ListView.builder(
            itemCount: listaCores.length,
            itemBuilder: (context, index){
              return ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TelaCor(
                        nomeCor: listaCores[index],
                        cor: cores[index],
                      )));
                },
                tileColor: cores[index],
                title: Text(listaCores[index], style: TextStyle(color: Colors.white),),
              );
            },
        ),
      ),
    );
  }
}

class TelaCor extends StatelessWidget {
  final String nomeCor;
  final Color cor;

  const TelaCor({super.key, required this.nomeCor, required this.cor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Página da cor $nomeCor"),
        ),
        body: Container(color: cor,),
      );
  }
}


