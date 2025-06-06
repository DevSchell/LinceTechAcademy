import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_com_http/cadastro_model.dart';
import 'get_api.dart';

void main() async {
  runApp(
    ChangeNotifierProvider(create: (_) => CadastroProvider(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider com JSON',
      routes: {'/': (context) => HomePage()},
      initialRoute: '/',
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Cadastros"), centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Consumer<CadastroProvider>(
              builder: (context, cadastros, child) => Center(
                child: ElevatedButton(
                  onPressed: () {
                    cadastros.loadCadastros();
                  },
                  child: Text("Carregar Cadastros"),
                ),
              ),
            ),
          ),
          Consumer<CadastroProvider>(
            builder: (context, cadastro, child) =>ElevatedButton(
                onPressed: () {
                  cadastro.LimparCadastros();
                },
                child: Text("Limpar cadastros")),
          ),
          Expanded(
            child: Consumer<CadastroProvider>(
              builder: (context, cadastros, child) => cadastros.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                itemCount: cadastros.cadastros.length,
                itemBuilder: (context, index) {
                  final cadastro = cadastros.cadastros[index];
                  return ListTile(
                    title: Text(cadastro.title),
                    subtitle: Text(cadastro.body),
                    trailing: ElevatedButton(
                        onPressed: () {
                          cadastros.deleteCadastro(cadastro);
                        },
                        child: Icon(Icons.delete)),
                  );
                },
              ),
            ),
          ),

        ],
      ),
    );
  }
}
