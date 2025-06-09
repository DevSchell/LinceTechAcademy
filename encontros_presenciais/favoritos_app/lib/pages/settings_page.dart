import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:favoritos/models/settings_provider.dart';

//TODO: SharedPreferences
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Color _corSelecionadaBg = Colors.white;
  Color _corSelecionadaAppBar = Colors.blue;
  List<Color> listaCores = [Colors.white, Colors.blue, Colors.red, Colors.green];

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settingsState, child) => Scaffold(
        backgroundColor: settingsState.bgColor,
        appBar: AppBar(
          title: Text("Configurações", style: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: settingsState.appBarColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Tema",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text("Cor do AppBar", style: TextStyle(fontSize: 15),),
              //TODO: dropdown... ?? Colors.white
              DropdownButton<Color>(
                isExpanded: true,
                value: _corSelecionadaAppBar,
                items: listaCores.map((Color cor) {
                  return DropdownMenuItem<Color>(
                    value: cor,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: cor,
                    ),
                  );
                }).toList(),
                onChanged: (novaCor) {
                  setState(() {
                    _corSelecionadaAppBar = novaCor!;
                  });
                },
              ),

              Text("Cor de background", style: TextStyle(fontSize: 15),),
              //TODO: dropdown... ?? Colors.blue
              DropdownButton<Color>(
                isExpanded: true,
                value: _corSelecionadaBg,
                items: listaCores.map((Color cor) {
                  return DropdownMenuItem<Color>(
                    value: cor,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: cor,
                    ),
                  );
                }).toList(),
                onChanged: (novaCor) {
                  setState(() {
                    _corSelecionadaBg = novaCor!;
                  });
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 2.0,
                  backgroundColor: settingsState.appBarColor,
                ),
                onPressed: () {
                  settingsState.editAppBarColor(_corSelecionadaAppBar);
                  settingsState.editBackgroundColor(_corSelecionadaBg);
                },
                child: Text("Salvar",style: TextStyle(color: Colors.white),)
              )
            ],
          ),
        ),
      ),
    );
  }
}


