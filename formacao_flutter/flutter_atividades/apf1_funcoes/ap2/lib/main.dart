import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int correctButton = Random().nextInt(3) + 1;
  late int selectedButton;
  Color bgColor = Colors.white;
  String texto = "Escolha 1 botão";
  int chances = 2;

  void analisarResposta(int valorBotao) {
    if(valorBotao == correctButton) {
      bgColor = Colors.green;
      texto = "Você ganhou!";
    } else {
      texto = "Errou, escolha outro";
      if (chances > 0) {
        chances--;
      }
    }

    if(chances == 0) {
      bgColor = Colors.red;
      texto = "Você perdeu";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Atividade 2",
          style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue,),
        backgroundColor: bgColor,
        body: Center(
          child: Column(
            children: <Widget>[
              Text(texto),
              Text("Você tem $chances chances"),
              Center(
                child: Row(
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () {
                         setState(() {
                           analisarResposta(1);
                         });
                        }
                        ,child: Text("A")),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            analisarResposta(2);
                          });
                        }
                        , child: Text("B")),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            analisarResposta(3);
                          });
                        }
                        , child: Text("C"))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

