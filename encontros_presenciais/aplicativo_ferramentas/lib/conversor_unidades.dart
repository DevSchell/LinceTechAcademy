import 'package:flutter/material.dart';

class ConversorUnidades extends StatefulWidget {
  const ConversorUnidades({super.key});

  @override
  State<ConversorUnidades> createState() => _ConversorUnidadesState();
}

class _ConversorUnidadesState extends State<ConversorUnidades> {
  String? tipoSelecionado;
  String? metroUnidadeSelecionadaEntrada;
  String? metroUnidadeSelecionadaSaida;

  final List<String> tipos = ["Comprimento", "Peso", "Temperatura"];
  final List<String> listaMetroUnidadeSelecionada = ["M", "KM", "CM"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(225, 230, 230, 1),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(0, 20, 69, 1),
        title: Text(
          "Conversor de Unidades",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Tipo',
                  hintText: 'distância, peso, temperatura...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                value: tipoSelecionado,
                items: tipos.map((String tipo) {
                  return DropdownMenuItem<String>(
                    value: tipo,
                    child: Text(tipo),
                  );
                }).toList(),
                onChanged: (String? novoValor) {
                  setState(() {
                    tipoSelecionado = novoValor;
                  });
                },
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Quantia',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    flex: 1,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      value: metroUnidadeSelecionadaEntrada,
                      items: listaMetroUnidadeSelecionada.map((String tipo) {
                        return DropdownMenuItem(
                          value: tipo,
                          child: Text(tipo),
                        );
                      }).toList(),
                      onChanged: (String? novoValor) {
                        setState(() {
                          metroUnidadeSelecionadaEntrada = novoValor;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Icon(Icons.swap_vert),
              SizedBox(height: 16),
              Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Quantia',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      keyboardType: TextInputType.none,
                      readOnly: true,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    flex: 1,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      value: metroUnidadeSelecionadaSaida,
                      items: listaMetroUnidadeSelecionada.map((String tipoMetros) {
                        return DropdownMenuItem(
                          value: tipoMetros,
                          child: Text(tipoMetros),
                        );
                      }).toList(),
                      onChanged: (String? novoValor) {
                        setState(() {
                          metroUnidadeSelecionadaSaida = novoValor;
                        });
                      },
                    ),
                  ),
                ],
              ),
              TextField(
                readOnly: true,
                decoration: null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
