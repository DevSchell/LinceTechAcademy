import 'package:compras_carrinho/carrinho_page.dart';
import 'package:compras_carrinho/models/carrinho_model.dart';
import 'package:compras_carrinho/models/produtos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ListaProdutos()),
        ChangeNotifierProvider(create: (_) => Carrinho()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carrinho de Compras',
      routes: {
        '/': (context) => Home(),
        '/carrinho': (context) => CarrinhoPage(),
      },
      initialRoute: '/',
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final listaProdutos = Provider.of<ListaProdutos>(
      context,
    ); //Usando provider, provendo a lista que vai ser o estoque

    return Scaffold(
      appBar: AppBar(
        title: Text("Produtos", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/carrinho');
          },
          child: Icon(Icons.shopping_cart),
        ),
      ),
      body: GridView.builder(
        itemCount: listaProdutos.produtosFakes.length,
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          final produto = listaProdutos.produtosFakes[index];

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      produto.imagemUrl,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.error),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    produto.nome,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'R\$ ${produto.preco.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  Consumer<Carrinho>(
                    builder: (context, carrinho, child) => ElevatedButton(
                      onPressed: () {
                        carrinho.addProduto(produto);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("produto adicionado com sucesso!"),
                            behavior: SnackBarBehavior.floating,
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.black87,
                          ),
                        );
                      },
                      child: Text("comprar"),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
