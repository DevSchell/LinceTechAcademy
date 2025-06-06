import 'package:flutter/material.dart';
import 'settings_page.dart';
import 'package:provider/provider.dart';
import 'package:basico_provider/models/settings_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Settings(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Settings>(
      builder: (context, settings, child) {
        return MaterialApp(
          title: "Básico Provider",
          routes: {
            "/": (context) => HomePage(),
            "/settings": (context) => SettingsPage(),
          },
          initialRoute: "/",
          darkTheme: ThemeData.dark(),
          theme: ThemeData.light(),
          themeMode: settings.isDark ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          spacing: 30,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<Settings>(
              builder: (context, settings, child) =>
                  Text(settings.name, style: const TextStyle(fontSize: 50)),
            ),

            Consumer<Settings>(
              builder: (context, settings, child) => Text(
                settings.age.toString(),
                style: const TextStyle(fontSize: 50),
              ),
            ),

            ElevatedButton(
              child: Text("Settings"),
              onPressed: () {
                Navigator.pushNamed(context, "/settings");
              },
            ),

            Consumer<Settings>(
              builder:
                  (BuildContext context, Settings settings, Widget? child) =>
                      ElevatedButton(
                        onPressed: () {
                          settings.switchTheme();
                        },
                        child: Text("Mudar tema"),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
