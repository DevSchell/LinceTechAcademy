import 'package:flutter/cupertino.dart';

import 'carrinho_model.dart';

class ListaProdutos extends ChangeNotifier{

  final List<Produto> produtosFakes = [
    Produto(
      id: '1',
      nome: 'Camisa Preta',
      imagemUrl: 'https://cdn.sistemawbuy.com.br/arquivos/13ef42c661356c967c0cee1859873499/produtos/65a9930f70caf/preta-frente-65de22e549c56.jpg',
      preco: 59.90,
    ),
    Produto(
      id: '2',
      nome: 'Tênis Branco',
      imagemUrl: 'https://cdn.shoppub.io/cdn-cgi/image/w=1000,h=1000,q=80,f=auto/enrico/media/uploads/produtos/foto/trobhsgv/0016_img_0038-1.jpg',
      preco: 199.90,
    ),
    Produto(
      id: '3',
      nome: 'Relógio Esportivo',
      imagemUrl: 'https://imgs.casasbahia.com.br/1566745157/1xg.jpg?imwidth=1000',
      preco: 299.90,
    ),
    Produto(
      id: '4',
      nome: 'Óculos de Sol',
      imagemUrl: 'https://chillibeans.vtexassets.com/arquivos/ids/520730-800-800?v=638338567036400000&width=800&height=800&aspect=true',
      preco: 99.90,
    ),
    Produto(
      id: '5',
      nome: 'Jaqueta Jeans',
      imagemUrl: 'https://lojasradan.vtexassets.com/arquivos/ids/431607/jaqueta-jeans-masculina-max-denim-11603-azul-10.38570-a.jpg?v=638464435569170000',
      preco: 149.90,
    ),
    Produto(
      id: '6',
      nome: 'Mochila Escolar',
      imagemUrl: 'https://lojabagaggio.vtexassets.com/arquivos/ids/2335526/0226708560001---MOCHILA-BG-GIRL-24J--ROSA-U00001.jpg?v=638350526251370000',
      preco: 89.90,
    ),
    Produto(
      id: '7',
      nome: 'Fones Bluetooth',
      imagemUrl: 'https://cdn.sistemawbuy.com.br/arquivos/16fb0aaa7aff7543520720e00a668415/produtos/64763d305d575/1-64763d30a296c.jpg',
      preco: 249.90,
    ),
    Produto(
      id: '8',
      nome: 'Notebook Gamer',
      imagemUrl: 'https://m.media-amazon.com/images/I/51DhlCpWmlL._AC_UF894,1000_QL80_.jpg',
      preco: 4999.90,
    ),
    Produto(
      id: '9',
      nome: 'Câmera Fotográfica',
      imagemUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTm517gGgSlNsEK0Glj7vQZjfzYrG6Yo8hyRA&s',
      preco: 1299.90,
    ),
    Produto(
      id: '10',
      nome: 'Smartwatch',
      imagemUrl: 'https://mormaiishop.vtexassets.com/arquivos/ids/4298441-800-auto?v=638597751213930000&width=800&height=auto&aspect=true',
      preco: 399.90,
    ),
  ];

}

