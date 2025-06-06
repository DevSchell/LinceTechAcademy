import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:basico_provider/models/settings_model.dart'; //Classe modelo de dados

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _idadeController = TextEditingController();
  final _chaveForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Page', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: _chaveForm,
            child: Column(
              spacing: 15,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _nomeController,
                  decoration: InputDecoration(labelText: "Nome"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Nome deve ser preenchido!";
                    }

                    if(value == null || RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return "Este espaço deve conter apenas letras";
                    }
                    return null;
                  },
                ),

                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _idadeController,
                  decoration: InputDecoration(labelText: "Idade"),
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return "Idade deve ser preenchida";
                    }

                    if(value == null || !RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return "Este espaço deve conter apenas números";
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if(_chaveForm.currentState!.validate()) {
                      var settings = context
                          .read<
                          Settings
                      >(); //Vai ler a parte da classe Settings e guardar aq na var
                      settings.name = _nomeController.text;
                      settings.age = int.parse(_idadeController.text);
                      Navigator.pop(context);
                    } else {
                      print("Informações inválidas");
                    }
                  },
                  child: Text("Save"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
