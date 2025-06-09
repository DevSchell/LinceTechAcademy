import 'package:favoritos/models/video_provider.dart';
import 'package:favoritos/pages/add_page.dart';
import 'package:flutter/material.dart';
import 'package:favoritos/pages/settings_page.dart';
import 'package:provider/provider.dart';
import 'models/api.dart';
import 'package:favoritos/models/settings_provider.dart';
import 'models/video_provider.dart';

void main() {
  runApp(MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsProvider()..loadPreferences()),
        ChangeNotifierProvider(create: (_) => VideoProvider()),
      ],
      child: MaterialApp(
        title: "Favoritos",
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => HomePage(),
          "/add": (context) => AddPage(),
          "/settings": (context) => SettingsPage(),
        },
        initialRoute: "/",
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final videoState = Provider.of<VideoProvider>(context);
    return Consumer<SettingsProvider>(
      builder: (context, settingsState, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          onPressed: () {
            Navigator.pushNamed(context, "/add");
          },
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: settingsState.appBarColor,
        ),
        appBar: AppBar(
          title: videoState.isSearching ?  Text(
            "Favoritos YT",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ) : Expanded(child: TextField(decoration: InputDecoration(labelText: "Pesquisar...", labelStyle: TextStyle(color: Colors.white38, fontWeight: FontWeight.bold, fontSize: 20)),)) ,
          backgroundColor: Provider.of<SettingsProvider>(context).appBarColor,
          actions: [
            InkWell(
              onTap: () {
                videoState.pesquisar();
              },
              child: Icon(Icons.search, color: Colors.white),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/settings");
              },
              child: Icon(Icons.settings, color: Colors.white),
            ),
          ],
          actionsPadding: EdgeInsets.all(8),
        ),
        backgroundColor: Provider.of<SettingsProvider>(context).bgColor,
        body: videoState.listaVideos.isEmpty
            ? Center(child: Text("Não há vídeos ainda..."))
        //TODO: Fazer cards nas tags
            : ListView.builder(
                itemCount: videoState.listaVideos.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.network(videoState.listaVideos[index].video.imagem, width: 400, height: 300,),
                        Text(
                          "${videoState.listaVideos[index].video.titulo}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(videoState.listaVideos[index].tags.isEmpty ? "Sem tags..." : videoState.listaVideos[index].tags.toString()),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Colors.black, width: 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
