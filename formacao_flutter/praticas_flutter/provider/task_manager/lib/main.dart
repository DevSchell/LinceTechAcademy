import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/tarefas_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Tarefas(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      routes: {'/': (context) => Home()},
      initialRoute: '/',
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _chaveForm = GlobalKey<FormState>();
  TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Task Manager",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            shadows: [
              Shadow(
                offset: Offset(2.0, 2.0), // deslocamento X e Y da sombra
                blurRadius: 3.0, // nível de "desfoque" da sombra
                color: Colors.black.withOpacity(
                  0.5,
                ), // cor da sombra com opacidade
              ),
            ],
          ),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: Form(
        key: _chaveForm,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                spacing: 16,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _taskController,
                      decoration: InputDecoration(
                        labelText: 'Criar uma nova tarefa...',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Campo deve ser preenchido antes de apertar o botão";
                        }
                        return null;
                      },
                    ),
                  ),
                  Consumer<Tarefas>(
                    builder: (context, tarefas, child) => FloatingActionButton(
                      onPressed: () {
                        if (_chaveForm.currentState != null &&
                            _chaveForm.currentState!.validate()) {
                          tarefas.addTarefa(_taskController.text);
                          _taskController.clear();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Tarefa adicionada!')),
                          );
                        }
                      },
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
            Consumer<Tarefas>(
              builder: (context, tarefas, child) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Você tem "),
                  Text(tarefas.listaTarefas.length.toString()),
                  Text(
                    tarefas.listaTarefas.length == 1
                        ? " tarefa pra fazer"
                        : " tarefas pra fazer",
                  ),
                ],
              ),
            ),
            Consumer<Tarefas>(
              builder: (context, tarefas, child) => Expanded(
                child: ListView.builder(
                  itemCount: tarefas.listaTarefas.length,
                  itemBuilder: (context, index) {
                    final item = tarefas.listaTarefas[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(item),
                        trailing: FloatingActionButton(onPressed: () {
                          tarefas.deleteTarefa(item);
                        },
                          child: Icon(Icons.delete),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
