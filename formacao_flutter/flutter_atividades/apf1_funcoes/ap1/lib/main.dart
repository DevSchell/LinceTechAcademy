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
  var textoCor = Colors.black;
  var cores = [Colors.black, Colors.blue, Colors.white, Colors.grey, Colors.orange];

  Color sortearCor() {
    Random random = Random();
    var corSelecionada = cores[random.nextInt(cores.length)];
    return corSelecionada;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Atividade 1",
          style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text("Olá mundo!", style: TextStyle(fontSize: 50, decoration: TextDecoration.none, color: textoCor),)
              ,ElevatedButton(
                  onPressed: () {
                    setState(() {
                      textoCor = sortearCor();
                      print("Cor alterada!");
                    });
              },
              child: Text("Sortear cor", style: TextStyle(color: Colors.black),),)
            ],
          ),
        ),
      ),
    );
  }

}
