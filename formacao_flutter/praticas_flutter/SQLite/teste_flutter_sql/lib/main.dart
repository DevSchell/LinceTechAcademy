import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_flutter/pages/homepage.dart';
import 'package:teste_flutter/pages/addpage.dart';
import 'package:teste_flutter/providers/cadastro_state.dart';
import 'package:teste_flutter/pages/settingspage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => CadastroState(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Teste flutter - cadastrar pessoas",
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => HomePage(),
        "/add": (context) => AddPage(),
        "/settings": (context) => SettingsPage(),
      },
      initialRoute: "/",
      theme:
          ThemeData.dark(), //TODO: Depois vou usar uma tela de config pra mudar o tema da aplicação
    );
  }
}
