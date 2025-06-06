import 'package:flutter/material.dart';
import 'package:http_com_provider_e_dontpad/get_api.dart';
import 'package:http_com_provider_e_dontpad/produtos_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ProdutosProvider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSON, provider e DontPad',
      routes: {'/': (context) => HomePage()},
      initialRoute: '/',
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print("Construindo HomePage");
    return Scaffold(
      appBar: AppBar(title: Text("Shopew"), centerTitle: true),
      body: Column(
        children: [
          Text("Lista de Produtos", style: TextStyle(fontSize: 40)),
          Consumer<ProdutosProvider>(builder: (context, produtosProvider, child) => ElevatedButton(
            onPressed: () {
              produtosProvider.carregarProdutos();
            },
            child: Icon(Icons.cloud_download_outlined),
          )),
          Expanded(
            child: Consumer<ProdutosProvider>(
              builder: (context, produtosProvider, child) =>
                  produtosProvider.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: produtosProvider.produtos.length,
                      itemBuilder: (context, index) {
                        final produto = produtosProvider.produtos[index];
                        return ListTile(
                          title: Text(produto.nome),
                          subtitle: Text(produto.preco.toStringAsFixed(2)),
                          trailing: ElevatedButton(
                            onPressed: () {},
                            child: Icon(Icons.add_shopping_cart_outlined),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

//TODO: Fazer tela de login, só pra pegar o nome do user msm
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shopíaui")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Seja bem-vindo!"),
          Text("Para usar nosso aplicativo, por favor insira seu nome e email"),
        ],
      ),
    );
  }
}
