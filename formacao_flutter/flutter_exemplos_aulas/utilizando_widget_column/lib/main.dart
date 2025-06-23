import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Aplicativo Exemplo Scaffold',
            style: TextStyle(color: Colors.white),
          ),
        ), // AppBar
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Text('Coluna 1', style: TextStyle(fontSize: 32)),
            ),
            Center(
              child: Text('Coluna 2', style: TextStyle(fontSize: 32)),
            ),
            Center(
              child: Text('Coluna 3', style: TextStyle(fontSize: 32)),
            )
          ],
        ), // Center
      ), // Scaffold
    ); // MaterialApp
  }
}