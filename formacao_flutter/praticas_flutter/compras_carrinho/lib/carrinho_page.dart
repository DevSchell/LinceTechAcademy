import 'package:compras_carrinho/models/carrinho_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarrinhoPage extends StatelessWidget {
  const CarrinhoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<Carrinho>(
              builder: (BuildContext context, Carrinho carrinho, Widget? child) {
                if (carrinho.listaProdutos.isEmpty) {
                  return Center(
                    child: Text("Carrinho vazio"),
                  );
                }

                return ListView.builder(
                  itemCount: carrinho.listaProdutos.length,
                  itemBuilder: (context, index) {
                    final produto = carrinho.listaProdutos[index];
                    return ListTile(
                      leading: Icon(Icons.shopping_cart),
                      title: Text(produto.nome),
                      subtitle: Text('Preço: R\$ ${produto.preco.toStringAsFixed(2)}'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          carrinho.deleteProduto(produto);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
