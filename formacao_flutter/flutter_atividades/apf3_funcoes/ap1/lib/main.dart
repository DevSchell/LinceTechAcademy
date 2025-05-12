import 'package:flutter/material.dart';

class User {
  late String nome;
  late int idade;
  late bool isActive;

  User({
    required this.nome,
    required this.idade,
    required this.isActive
});

}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey =
      GlobalKey<FormState>(); //TODO: Pesquisar pra que serve isso...

  //Usando controllers pra limpar os TextFields dps de cadastros
  final nomeController = TextEditingController();
  final idadeController = TextEditingController();

  //Lista de usuários
  List<User> listaUsuarios = [];

  //Guardar dados
  String nomeGeral = "";
  late int idadeGeral;
  bool isAtivo = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text("Atividade 1 - Formulário")),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Insira seus dados: "),
                TextFormField(
                  controller: nomeController,
                  decoration: InputDecoration(labelText: "Nome"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Campo obrigatório";
                    }

                    if (value.length < 3) {
                      return "O nome deve ter pelo menos 3 letras";
                    }

                    if (!RegExp(r'^[A-Z]').hasMatch(value)) {
                      return "O nome deve começar com letra maiúscula";
                    }
                    nomeGeral = value;
                    return null;
                  },
                ),
                TextFormField(
                  controller: idadeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Campo obrigastório";
                    }

                    final idade = int.tryParse(value);

                    if (idade == null) {
                      return "Digite um número válido";
                    }

                    if (idade < 18) {
                      return "Usuário precisa ser maior do que 18 anos";
                    }

                    idadeGeral = idade;
                    return null;
                  },
                  decoration: InputDecoration(labelText: "Idade"),
                  keyboardType: TextInputType.number,
                ),
                Row(
                  children: [
                    Text("Usuário ativo"),
                    Checkbox(
                      value: isAtivo,
                      onChanged: (checked) {
                        isAtivo =
                            checked!; // "!" serve pra simbolizar que não será nulo
                        setState(() {
                          isAtivo = checked;
                        });
                      },
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("Cadastro salvo!");
                      User usuario = User(nome: nomeGeral, idade: idadeGeral, isActive: isAtivo);
                      listaUsuarios.add(usuario);

                      //Resetando campos aq
                      nomeController.clear();
                      idadeController.clear();
                      isAtivo = false;
                    } else {
                      print("Formulário inválido!");
                    }
                    setState(() {
                    });
                  },
                  child: Text("Salvar"),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: listaUsuarios.length,
                    itemBuilder: (context, index){
                      final user = listaUsuarios[index];
                      return Container(
                        color: user.isActive ? Colors.green : Colors.grey,
                        child: ListTile(
                          title: Text("Nome: ${user.nome}"),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Idade: ${user.idade}"),
                              Text("Status: ${user.isActive ? "Ativo" : "Inativo"}"),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
