import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Eu fiz essa atividade com o celular rotacionado pro lado...
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text("Atividade 2")),
        body: Row(
          children: [
            Container( //Quadrado #1 (cinza)
              margin: EdgeInsets.all(8),
              color: Colors.grey,
              width: 100,
              height: 100,
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      color: Colors.red,
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      color: Colors.green,
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 30,
                    child: Container(
                      color: Colors.blue,
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
            Container( //Quadrado #2 (preto)
              color: Colors.black,
              margin: EdgeInsets.all(8),
              width: 100,
              height: 100,
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      color: Colors.cyan,
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      color: Colors.purple,
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 30,
                    child: Container(
                      color: Colors.yellow,
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
            Container( //Quadrado #3 (transparente)
              margin: EdgeInsets.all(8),
              width: 100,
              height: 100,
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      color: Colors.red,
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      color: Colors.yellow,
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 30,
                    child: Container(
                      color: Colors.blue,
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
            Container( //Quadrado #4 (branco)
              color: Colors.white,
              margin: EdgeInsets.all(8),
              width: 100,
              height: 100,
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      color: Colors.deepPurple,
                      width: 50,
                      height: 50,
                    ),
                  ),

                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      color: Colors.deepOrange,
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 30,
                    child: Container(
                      color: Colors.yellow,
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 40,
                    child: Container(
                      color: Colors.lightGreenAccent,
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
