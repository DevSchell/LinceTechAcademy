import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_flutter/providers/cadastro_state.dart';

Color themeColor = Colors.purple;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CadastroState>(
      builder: (context, cadastroState, child) => Scaffold(
        appBar: AppBar(
          title: Text("Lista de Cadastros"),
          centerTitle: true,
          backgroundColor: themeColor,
          actionsPadding: EdgeInsets.all(8),
          actionsIconTheme: IconThemeData(color: Colors.white),
          actions: [
            InkWell(
              child: Icon(Icons.settings),
              onTap: () {
                Navigator.pushNamed(context, "/settings");
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cadastroState.listaCadastros.length,
                itemBuilder: (context, index) {
                  final cadastro = cadastroState.listaCadastros[index];
                  return ListTile(
                    title: Text(cadastro.nome),
                    trailing: InkWell(
                      child: Icon(Icons.delete),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Cadastro excluído com sucesso!"),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        cadastroState.deleteCadastro(cadastro);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "/add");
          },
          shape: CircleBorder(),
          child: Icon(Icons.add),
          backgroundColor: themeColor,
        ),
      ),
    );
  }
}
