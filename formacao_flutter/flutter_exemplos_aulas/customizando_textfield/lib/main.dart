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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Página de Login",),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Insira seus dados", style: TextStyle(fontSize: 20),),
              TextField(
                decoration: InputDecoration(
                  labelText: "e-mail"
                ),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "senha",
                ),
              ),

              ElevatedButton(
                  onPressed: () {},
                  child: Text("Entrar")),

              Text("Esqueceu sua senha?")
            ],
          ),
        ),
      ),
    );
  }
}
