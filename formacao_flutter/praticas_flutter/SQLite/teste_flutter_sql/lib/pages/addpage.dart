import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_flutter/providers/cadastro_state.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<CadastroState>(
      builder: (context, cadastroState, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text("Cadastrar pessoa"),
          centerTitle: true,
        ),
        body: Form(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Nome"),
                TextFormField(
                  controller: _nomeController,
                  decoration: InputDecoration(
                    labelText: "Digite o nome aqui...",
                  ),
                ),
                Text("Telefone"),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Campo deve ser preenchido!";
                    }
                    final regex = RegExp(r'^[a-zA-ZÀ-ÿ\s]+$');
                    if (!regex.hasMatch(value)) {
                      return 'Use apenas letras';
                    }
                    return null;
                  },
                  controller: _telefoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Digite o telefone aqui...",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                    onPressed: () {
                      cadastroState.addCadastro(
                        Cadastro(
                          nome: _nomeController.text,
                          telefone: _telefoneController.text,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Cadastro criado com sucesso!",),
                        duration: Duration(seconds: 2),
                      )
                      );
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Salvar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
