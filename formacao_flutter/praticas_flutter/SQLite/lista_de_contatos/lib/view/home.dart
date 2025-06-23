import 'package:flutter/material.dart';
import 'package:lista_de_contatos/provider/pessoaState.dart';
import 'package:provider/provider.dart';
import 'package:lista_de_contatos/model/pessoa.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PessoaState>(
      builder: (context, providerPessoa, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Colors.blue,
          onPressed: () {
            final TextEditingController nomeController =
                TextEditingController();

            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Digite o nome'),
                  content: TextField(
                    controller: nomeController,
                    decoration: const InputDecoration(labelText: 'Nome'),
                  ),
                  actions: [
                    TextButton(
                      child: const Text('Cancelar'),
                      onPressed: () {
                        Navigator.of(context).pop(); // fecha o popup
                      },
                    ),
                    ElevatedButton(
                      child: const Text('Salvar'),
                      onPressed: () {
                        final Pessoa p = Pessoa(
                          nome: nomeController.text,
                          id: null,
                        );
                        providerPessoa.add(p);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.blue,
          title: const Text(
            "Lista de Contatos",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: providerPessoa.listaPessoa.length,
                itemBuilder: (context, index) {
                  final pessoa = providerPessoa.listaPessoa[index];
                  return ListTile(
                    title: Text(pessoa.nome),
                    leading: Text("ID: ${pessoa.id}"),
                    trailing: InkWell(
                      child: Icon(Icons.delete),
                      onTap: () {
                        print("Função não criada ainda :p");
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
