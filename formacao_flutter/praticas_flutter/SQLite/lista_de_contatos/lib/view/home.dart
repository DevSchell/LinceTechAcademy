import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.blue,
        onPressed: () {
          final TextEditingController nomeController = TextEditingController();

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Digite o nome'),
                content: TextField(
                  controller: nomeController,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text('Cancelar'),
                    onPressed: () {
                      Navigator.of(context).pop(); // fecha o popup
                    },
                  ),
                  ElevatedButton(
                    child: Text('Salvar'),
                    onPressed: () {
                      final nome = nomeController.text.trim();
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: Text("Lista de Contatos", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
