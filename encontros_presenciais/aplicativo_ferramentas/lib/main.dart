import 'package:flutter/material.dart';
import 'conversor_unidades.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ferramentas",
      color: Color.fromRGBO(0, 20, 69, 1),
      initialRoute: "/",
      routes: {
        '/': (context) => Home(),
        '/conversor_unidades': (context) => ConversorUnidades(),
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 20, 69, 1),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/lince_tech_academy.webp", height: 250),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                spacing: 16,
                children: [
                  Expanded(
                    child: CustomButton(
                      label: "Conversor de Moedas",
                      imagePath: "assets/images/moeda.webp",
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: CustomButton(
                      label: "Conversor de Unidades",
                      imagePath: "assets/images/regua.png",
                      onTap: () {
                        Navigator.pushNamed(context, "/conversor_unidades");
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                isVertical: false,
                label: "Calculadora",
                imagePath: "assets/images/calculadora.png",
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.label,
    required this.imagePath,
    required this.onTap,
    this.isVertical = true,
  });

  final String label;
  final String imagePath;
  final void Function() onTap;
  final bool isVertical;

  @override
  Widget build(BuildContext context) {
    final children = [
      Image.asset(imagePath),
      Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
    ];
    final child = isVertical
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          )
        : Row(mainAxisAlignment: MainAxisAlignment.center, children: children);

    return Material(
      color: Color.fromRGBO(15, 61, 140, 1),
      elevation: 2,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(padding: const EdgeInsets.all(8.0), child: child),
      ),
    );
  }
}
