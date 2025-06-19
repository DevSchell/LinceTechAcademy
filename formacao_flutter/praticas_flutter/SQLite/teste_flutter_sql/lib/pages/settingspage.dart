import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _corSelecionadaAppBar = 'Roxo';
  String _corSelecionadaBackground = 'Preto';

  final Map<String, Color> coresDisponiveis = {
    'Roxo': Colors.purple,
    'Vermelho': Colors.red,
    'Verde': Colors.green,
    'Azul': Colors.blue,
    'Preto': Colors.black,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: coresDisponiveis[_corSelecionadaAppBar],
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Configurações",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Escolha uma nova cor para a AppBar: "),
            DropdownButton<String>(
              value: _corSelecionadaAppBar,
              items: coresDisponiveis.keys
                  .map(
                    (nomeCor) =>
                        DropdownMenuItem(value: nomeCor, child: Text(nomeCor)),
                  )
                  .toList(),
              onChanged: (String? novaCor) {
                if (novaCor != null) {
                  setState(() {
                    _corSelecionadaAppBar = novaCor;
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            const Text("Escolha uma nova cor para o background: "),
            DropdownButton<String>(
              value: _corSelecionadaBackground,
              items: coresDisponiveis.keys
                  .map(
                    (nomeCor) =>
                        DropdownMenuItem(value: nomeCor, child: Text(nomeCor)),
                  )
                  .toList(),
              onChanged: (String? novaCor) {
                if (novaCor != null) {
                  setState(() {
                    _corSelecionadaBackground = novaCor;
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {},
                child: Text("Salvar", style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple
              ),
            ),
          ],
        ),
      ),
    );
  }
}
