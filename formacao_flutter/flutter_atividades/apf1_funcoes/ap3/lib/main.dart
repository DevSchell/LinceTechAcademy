import 'package:flutter/material.dart';
import 'dart:math';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

enum EstadoDoJogo { jogando, ganhou, perdeu }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: MyWidget())),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final random = Random();
  EstadoDoJogo estado = EstadoDoJogo.jogando;

  int botaoCorreto = 0;
  int clicks = 0;

  int vitorias = 0;
  int derrotas = 0;

  void reiniciarJogo() {
    setState(() {
      botaoCorreto = random.nextInt(3);
      clicks = 0;
      estado = EstadoDoJogo.jogando;
    });
  }

  @override
  void initState() {
    super.initState();
    botaoCorreto = random.nextInt(3);
  }

  void tentativa(int opcao) {
    setState(() {
      if (opcao == botaoCorreto) {
        estado = EstadoDoJogo.ganhou;
        vitorias++;
      } else {
        clicks++;
        if (clicks >= 2) {
          estado = EstadoDoJogo.perdeu;
          derrotas++;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (estado) {
      case EstadoDoJogo.ganhou:
        return VitoriaWidget(
          onReiniciar: reiniciarJogo,
          vitorias: vitorias,
          derrotas: derrotas,
        );
      case EstadoDoJogo.perdeu:
        return DerrotaWidget(
          onReiniciar: reiniciarJogo,
          vitorias: vitorias,
          derrotas: derrotas,
        );
      case EstadoDoJogo.jogando:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Escolha o botão certo!", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              child: const Text('A'),
              onPressed: () => tentativa(0),
            ),
            ElevatedButton(
              child: const Text('B'),
              onPressed: () => tentativa(1),
            ),
            ElevatedButton(
              child: const Text('C'),
              onPressed: () => tentativa(2),
            ),
            SizedBox(height: 20),
            Text("Vitórias: $vitorias  |  Derrotas: $derrotas"),
          ],
        );
    }
  }
}

class VitoriaWidget extends StatelessWidget {
  final VoidCallback onReiniciar;
  final int vitorias;
  final int derrotas;

  const VitoriaWidget({
    super.key,
    required this.onReiniciar,
    required this.vitorias,
    required this.derrotas,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Você ganhou!", style: TextStyle(fontSize: 24)),
            Text("Vitórias: $vitorias | Derrotas: $derrotas"),
            SizedBox(height: 20),
            ElevatedButton(onPressed: onReiniciar, child: Text("Reiniciar")),
          ],
        ),
      ),
    );
  }
}

class DerrotaWidget extends StatelessWidget {
  final VoidCallback onReiniciar;
  final int vitorias;
  final int derrotas;

  const DerrotaWidget({
    super.key,
    required this.onReiniciar,
    required this.vitorias,
    required this.derrotas,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Você perdeu!", style: TextStyle(fontSize: 24)),
            Text("Vitórias: $vitorias | Derrotas: $derrotas"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: onReiniciar,
              child: Text("Tentar novamente"),
            ),
          ],
        ),
      ),
    );
  }
}
