import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

enum Formato { circulo, quadrado }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

List<Color> cores = [
  Colors.red,
  Colors.yellow,
  Colors.lightGreenAccent,
  Colors.blueAccent,
  Colors.cyanAccent,
  Colors.purple,
  Colors.pink,
];

class _MyAppState extends State<MyApp> {
  Formato formato = Formato.quadrado;
  Color cor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text("Atividade 3")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        formato =
                            formato == Formato.circulo ? Formato.quadrado : Formato.circulo;
                      });
                    },
                    child: Text(
                      formato == Formato.circulo ? "Mudar para quadrado" : "Mudar para círculo", style: TextStyle(color: Colors.white),),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      int index = Random().nextInt(cores.length);
                      setState(() {
                        cor = cores[index];
                      });
                    },
                    child: Text(
                      "Cor aleatoria",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: cor,
                  shape:
                      formato == Formato.circulo
                          ? BoxShape.circle
                          : BoxShape.rectangle,
                ),
                margin: EdgeInsets.all(8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
