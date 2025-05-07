import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Atividade 1"),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container( //Quadrado vermelho
                  color: Colors.red,
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.all(8),
                ),
                Container( //Quadrado verde
                  color: Colors.green,
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.all(8),
                ),
                Container( //Quadrado azul
                  color: Colors.blue,
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.all(8),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(8),
                  color: Colors.yellow,
                  child: Row( // Retângulo amarelo grandão
                    children: <Widget>[
                      Container( //Retângulo roxo
                        color: Colors.purple,
                        width: 50,
                        height: 100,
                        margin: EdgeInsets.all(8),
                      ),
                      Container( //Retângulo ciano
                        color: Colors.cyan,
                        width: 50,
                        height: 100,
                        margin: EdgeInsets.all(8),
                      ),
                      Column(
                        children: <Widget>[
                          Container( //Quadrado roxo
                            color: Colors.purple,
                            width: 50,
                            height: 50,
                            margin: EdgeInsets.all(8),
                          ),
                          Container( //Quadrado ciano
                            color: Colors.cyan,
                            width: 50,
                            height: 50,
                            margin: EdgeInsets.all(8),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  color: Colors.grey.shade500,
                  width: 100,
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  child:
                  Container(
                    color: Colors.black,
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.all(8),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
}
}

