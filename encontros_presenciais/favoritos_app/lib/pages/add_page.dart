import 'package:favoritos/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:favoritos/models/video_provider.dart';
import 'package:provider/provider.dart';

import '../models/settings_provider.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController _urlController = TextEditingController();
  TextEditingController _tagsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settingsState, child) => Scaffold(
        backgroundColor: settingsState.bgColor,
        appBar: AppBar(
          title: Text("Cadastro", style: TextStyle(color: Colors.white)),
          backgroundColor: settingsState.appBarColor,
          iconTheme: IconThemeData(color: Colors.white),
          actionsPadding: EdgeInsets.all(8),
          actions: [
            InkWell(
              onTap: () {
                final url = _urlController.text;
                final linhaDeTags = _tagsController.text;
                Provider.of<VideoProvider>(context, listen: false).url = url;
                Provider.of<VideoProvider>(
                  context,
                  listen: false,
                ).addVideo(linhaDeTags);
                print("adicionando vídeo!");
                Navigator.pop(context);
              },
              child: Icon(Icons.check),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            child: Column(
              spacing: 30,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("URL do vídeo: "),
                    TextFormField(
                      controller: _urlController,
                      decoration: InputDecoration(
                        label: Text(
                          "youtu.be/hfuHSYUBRsi93G",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Categorias (#)"),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Valor deve ser preenchido!";
                        }
                        return null;
                      },
                      controller: _tagsController,
                      decoration: InputDecoration(
                        label: Text(
                          "jogos, sous-like...",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
