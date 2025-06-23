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
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Text('Meu Aplicativo', style: TextStyle(fontSize: 12)),
            ),
            Center(
              child: Text('Meu Aplicativo', style: TextStyle(fontSize: 12)),
            ),
            Center(
              child: Text('Meu Aplicativo', style: TextStyle(fontSize: 12)),
            )
          ],
        ), // Center
      ), // Scaffold
    ); // MaterialApp
  }
}
