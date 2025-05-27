import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => EstadoListaDePessoas(),
      child: MyApp(),
    ),
  );
}

enum TipoSanguineo {
  aPositivo,
  aNegativo,
  bPositivo,
  bNegativo,
  oPositivo,
  oNegativo,
  abPositivo,
  abNegativo,
}

class Pessoa {
  const Pessoa({
    required this.nome,
    required this.email,
    required this.telefone,
    required this.github,
    required this.tipoSanguineo,
  });

  final String nome;
  final String email;
  final String telefone;
  final String github;
  final TipoSanguineo tipoSanguineo;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pessoa &&
          runtimeType == other.runtimeType &&
          nome == other.nome &&
          email == other.email &&
          telefone == other.telefone &&
          github == other.github &&
          tipoSanguineo == other.tipoSanguineo;

  @override
  int get hashCode =>
      nome.hashCode ^
      email.hashCode ^
      telefone.hashCode ^
      telefone.hashCode ^
      github.hashCode ^
      tipoSanguineo.hashCode;
}

class EstadoListaDePessoas with ChangeNotifier {
  final _listaDePessoas = <Pessoa>[];

  List<Pessoa> get pessoas => List.unmodifiable(_listaDePessoas);

  void incluir(Pessoa pessoa) {
    _listaDePessoas.add(pessoa);
    notifyListeners();
  }

  void excluir(Pessoa pessoa) {
    _listaDePessoas.remove(pessoa);
    notifyListeners();
  }

  void editarPessoa(Pessoa pessoaNova, Pessoa pessoaAntiga) {
    final index = _listaDePessoas.indexOf(pessoaAntiga);
    if (index != -1) {
      _listaDePessoas[index] = pessoaNova;
      notifyListeners();
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      initialRoute: '/',
      routes: {
        '/': (context) => TelaInicial(),
        '/listagem': (context) => TelaListagem(),
        '/formulario': (context) => TelaFormulario(),
      },
    );
  }
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Tipos Sanguíneos",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  Navigator.pushNamed(context, '/listagem');
                },
                child: Text(
                  "Ver Pessoas",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  Navigator.pushNamed(context, '/formulario');
                },
                child: Text(
                  "Cadastrar Pessoa",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

TipoSanguineo? _filtroSangue; //Variável do filtro

class TelaListagem extends StatefulWidget {
  const TelaListagem({super.key});

  @override
  State<TelaListagem> createState() => _TelaListagemState();
}

class _TelaListagemState extends State<TelaListagem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Lista de Cadastros",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DropdownButtonFormField<TipoSanguineo>(
              value: _filtroSangue,
              items: [null, ...TipoSanguineo.values].map((tipo) {
                return DropdownMenuItem(
                  value: tipo,
                  child: Text(
                    tipo == null ? "Todos" : tipo.toString().split(".").last,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _filtroSangue = value; // Guarda o filtro escolhido
                });
              },
            ),
            Consumer<EstadoListaDePessoas>(
              builder: (context, estado, child) {
                final pessoas = _filtroSangue == null
                    ? estado.pessoas
                    : estado.pessoas
                          .where((p) => p.tipoSanguineo == _filtroSangue)
                          .toList();

                if (pessoas.isEmpty) {
                  return Center(
                    child: Text(
                      "Ainda não há pessoas cadastradas",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: pessoas.length,
                    itemBuilder: (context, index) {
                      final pessoa = pessoas[index];
                      late var cor;
                      switch(pessoa.tipoSanguineo){
                        case TipoSanguineo.abPositivo:
                          cor = Colors.cyan;
                          break;

                        case TipoSanguineo.abNegativo:
                          cor = Colors.white;
                          break;

                        case TipoSanguineo.oPositivo:
                          cor = Colors.green;
                          break;

                        case TipoSanguineo.oNegativo:
                          cor = Colors.yellow;
                          break;

                        case TipoSanguineo.bPositivo:
                          cor = Colors.purple;
                          break;

                        case TipoSanguineo.bNegativo:
                          cor = Colors.orange;
                          break;

                        case TipoSanguineo.aPositivo:
                          cor = Colors.blue;
                          break;

                        case TipoSanguineo.aNegativo:
                          cor = Colors.red;
                          break;
                      }
                      return ListTile(
                        title: Text(pessoa.nome),
                        subtitle: RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: [
                                TextSpan(text: "${pessoa.email} | "),
                                TextSpan(
                                  text: pessoa.tipoSanguineo.toString().split(".").last,
                                  style: TextStyle(color: cor,backgroundColor: cor == Colors.white ? Colors.black : Colors.white)
                                ),
                                TextSpan(
                                  text: "${pessoa.telefone} | "
                                ),
                                TextSpan(
                                  text: " | ${pessoa.github }"
                                )
                              ]
                            )
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.red),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        TelaFormulario(pessoa: pessoa),
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                estado.excluir(pessoa);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Cadastro excluído com sucesso",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TelaFormulario extends StatefulWidget {
  final Pessoa? pessoa;

  const TelaFormulario({super.key, this.pessoa});

  @override
  State<TelaFormulario> createState() => _TelaFormularioState();
}

class _TelaFormularioState extends State<TelaFormulario> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _githubController = TextEditingController();
  TipoSanguineo? _tipoSanguineo;

  @override
  void initState() {
    super.initState();
    if (widget.pessoa != null) {
      _nomeController.text = widget.pessoa!.nome;
      _emailController.text = widget.pessoa!.email;
      _telefoneController.text = widget.pessoa!.telefone;
      _githubController.text = widget.pessoa!.github;
      _tipoSanguineo = widget.pessoa!.tipoSanguineo;
    }
  }

  final _chaveForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Formulários", style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _chaveForm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Nome: ",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: _nomeController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "O nome não pode ser vazio!";
                  }
                  return null; //Se passou
                },
              ),
              Text(
                "Email: ",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "O nome não pode ser vazio!";
                  }
                  if (!value.contains("@")) {
                    return "Informe o um email válido!";
                  }

                  return null;
                },
              ),
              Text(
                "Telefone: ",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: _telefoneController,
                validator: (value) {
                  if (value.toString().length != 11) {
                    return "Insira um número de telefone válido";
                  }

                  return null;
                },
              ),
              Text(
                "GitHub: ",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(controller: _githubController),
              Text(
                "Tipo sanguíneo: ",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButtonFormField<TipoSanguineo>(
                hint: Text("Selecione o tipo sanguíneo"),
                validator: (value) {
                  if (value == null) {
                    return "Selecione um tipo sanguíneo!";
                  }

                  return null;
                },
                style: TextStyle(color: Colors.red),
                value: _tipoSanguineo,
                items: TipoSanguineo.values.map((tipo) {
                  return DropdownMenuItem(
                    value: tipo,
                    child: Text(tipo.toString().split(".").last),
                  );
                }).toList(),
                onChanged: (TipoSanguineo? novoTipo) {
                  setState(() {
                    _tipoSanguineo = novoTipo;
                  });
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  if (_chaveForm.currentState!.validate()) {
                    // Validando Form aq
                    Pessoa novoCadastro = Pessoa(
                      nome: _nomeController.text,
                      email: _emailController.text,
                      telefone: _telefoneController.text,
                      github: _githubController.text,
                      tipoSanguineo: _tipoSanguineo!,
                    );

                    final estado = Provider.of<EstadoListaDePessoas>(
                      context,
                      listen: false,
                    );

                    if (widget.pessoa == null) {
                      estado.incluir(novoCadastro);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Cadastro salvo com sucesso!",
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else {
                      estado.editarPessoa(novoCadastro, widget.pessoa!);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Cadastro editado com sucesso!",
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }

                    Navigator.pop(context);
                  }
                },
                child: Text("Salvar", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
