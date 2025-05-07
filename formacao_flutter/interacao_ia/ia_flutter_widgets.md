# Interação IA - Widgets Básicos
## Espaçamento entre widgets dentro do ``Row``
* Em um ``Row`` (também funciona em ``Column``), você pode controlar o espalamento entre os widgets utilizando a propriedade ``mainAxisAlignment``. Para um espaçamento uniforme, o valor ideal é ``MainAxisAlignment.spaceAround``, ``MainAxisAlignment.spaceBetween`` ou ``MainAxisAlignment.spaceevenly``.
    * ``MainAxisAlignment.spaceAround``: Distribui o espaço de forma que haja o mesmo espaço antes do primeiro widget entre cada widget e depois do último widget
    * ``MainAxisAlignment.spaceBetween``: Distribui o espaço entre os widgets, colando o primeiro widget no início e o último no final do ``Row``
    * ``MainAxisAlignment.spaceEvenly``: Distribui o espaço igualmente entre todos os widgets, incluindo o espaço antes do primeiro e depois do último
~~~
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Espaçamento em Row'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const Text('spaceAround:', style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const <Widget>[
                  Icon(Icons.home),
                  Icon(Icons.search),
                  Icon(Icons.settings),
                ],
              ),
              const SizedBox(height: 20),
              const Text('spaceBetween:', style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Icon(Icons.home),
                  Icon(Icons.search),
                  Icon(Icons.settings),
                ],
              ),
              const SizedBox(height: 20),
              const Text('spaceEvenly:', style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const <Widget>[
                  Icon(Icons.home),
                  Icon(Icons.search),
                  Icon(Icons.settings),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
~~~

## Conceito de Stack em FLutter
* Um widget ``Stack`` no Flutter permite que você **sobreponha widgets uns sobre os outros**
* Pense em uma pilha de papéis: você pode colocar um papel em cima do outro, e a ordem que você coloca define qual papel fica visível por cima.
* No ``Stack``, os widgets são renderizados na ordem em que aparecem na lista de ``children``, com o último widget na lista ficando no topo
~~~
        appBar: AppBar(
          title: const Text('Widget Stack'),
        ),
        body: Center(
          child: Stack(
            alignment: Alignment.center, // Alinha os filhos no centro por padrão
            children: <Widget>[
              Container(
                width: 200,
                height: 200,
                color: Colors.blue,
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.red,
              ),
              const Text(
                'Olá!',
                style: TextStyle(fontSize: 24, color: Colors.white),
~~~

### Vantagens de usar o ``Stack`` em vez de ``Row`` e ``Column``
* **Sobreposição de elementos**: Ideal para criar interfaces onde um widget precisa focar sobre o outro, como:
  *   Textos sobre imagens
  * Ícones sobrepostos a outros elementos
  * Animações ou efeitos visuais que envolvem camadas
  * Criação de "badges" ou notificações em cima de ícones
* Posicionamento preciso: O ``Stack`` oferece mais controle sobre o posicionamento de widgets específicos dentro de seus limites usando o widget ``Positioned``

### Quando usar o ``Row`` ou ``Column``
* Quando você precisa organizar widgets em uma sequência linear, seja horizontal(``Row``) ou vertical(``Column``)
* Para layouts mais simples onde não há necessidade de sobreposição
* Geralmente, a estrutura básica de uma tela é construída com ``Column``(para organizar elementos verticalmente,
como ``Appbar``, ``Body``, ``BottomNavigationBar``) e dentro do ``body``, você pode usar ``Row`` (para organizar elementos horizontalmente)

### Posicionar widgets específicos dentro de um ``Stack``
* Dentro de um ``Stack``, podemos usar o Widget ``Positioned`` para controlar a posição exata de um ou mais de seus filhos. O ``Positioned`` permite **definir as distâncias do widgets
em relação às bordas do ``Stack``**(top, bottom, left, right), além de **largura e altura**
~~~
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Posicionamento em Stack'),
        ),
        body: Center(
          child: Stack(
            children: <Widget>[
              Container(
                width: 300,
                height: 200,
                color: Colors.grey[300],
              ),
              Positioned(
                top: 10,
                left: 20,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
              ),
              Positioned(
                bottom: 30,
                right: 40,
                child: const Text(
                  'Importante!',
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
~~~

## Exibir uma imagem em arquivo Flutter
1. **Crie uma pasta de assets**: Na raiz do seu projeto Flutter, crie uma pasta chamada, por exemplo, ``assets``. Dentro dela, crie outra pasta, como ``images``
2. **Adicione a imagem**: Coloque o arquivo de imagem (por exemplo, ``minha_imagem.png``) dentro da pasta ``assets/images``
3. **Declare os assets no ``pubspec.yaml``**: Abra o arquivo ``pubspec.yaml`` na raiz do seu projeto e adicione a seguinte seção dentro de ``flutter``: 
~~~
flutter:
  assets:
    - assets/images/minha_imagem.png
    # Você pode declarar a pasta inteira também:
    # - assets/images/
~~~
4. Use ``Image.asset()`` no seu código:
~~~
import 'package:flutter/material.dart';
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Imagem Local'),
        ),
        body: Center(
          child: Image.asset('assets/images/minha_imagem.png'),
        ),
      ),
    ),
  );
}
~~~

## Como adicionar itens dinamicamente à um ``Listview``?
* Para adicionar itens dinamicamente à um ``ListView``, você geralmente usa o widget ``ListView.builder``. Ele constrói os itens da lista sob demanda, o que é eficiente para listas
longas, pois apenas os itens visíveis na tela são construídos
* Você precisa fornecer dois parâmetros principais para ``ListView.builder``
  * ``itemCount``: O **número total de itens** na sua lista
  * ``itemBuilder``: Uma função que **recebe o BuildContext** e o **índice** do item e **retorna o widget a ser exibido** naquele índice
~~~
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: DynamicListView(),
    ),
  );
}

class DynamicListView extends StatefulWidget {
  const DynamicListView({super.key});

  @override
  State<DynamicListView> createState() => _DynamicListViewState();
}

class _DynamicListViewState extends State<DynamicListView> {
  final List<String> _itens = List<String>.generate(20, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Dinâmico'),
      ),
      body: ListView.builder(
        itemCount: _itens.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_itens[index], style: const TextStyle(fontSize: 18)),
          );
        },
      ),
    );
  }
}
~~~

## E as diferenças entre ``ListView.builder`` e ``ListView.separated``?
* Ambos ``ListView.builder`` e ``ListView.separated`` são usados para **construir listas dinâmicas de forma eficiente**. A principal diferença é que ``ListView.separated`` **oferece uma maneira 
integrada de adicionar um separador** entre cada item da lista
  * ``ListView.builder``: Constrói os itens da lista usando a função ``itemBuilder``. Você precisa adicionar **qualquer separador**(como um ``Divider`` ou um ``Padding``) manualmente dentro do
  ``itemBuilder`` se desejar
  * ``ListView.separated``: Além de ``itemCount`` e ``itemBuilder``, ele possui um parâmetro adicional chamado ``separatorBuilder``. Este é uma função que recebe o ``BuildContext`` e o
  **índice** e **retorna o widget que será usado como separador** entre os itens
~~~
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: SeparatedListView(),
    ),
  );
}

class SeparatedListView extends StatelessWidget {
  const SeparatedListView({super.key});

  final List<String> _itens = List<String>.generate(10, (i) => 'Produto ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Separado'),
      ),
      body: ListView.separated(
        itemCount: _itens.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(_itens[index], style: const TextStyle(fontSize: 16)),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(); // Adiciona uma linha horizontal como separador
        },
      ),
    );
  }
}
~~~

## Como usar ``ListTile`` para criar itens de lista em um ``ListView``?
* O widget ``ListTile`` é projetado especificamente para ser usado como um item em um ``ListView``
* Ele fornece uma **estrutura padrão** para exibir informações de forma organizada em uma linha, geralmente contendo um **título**, um **subtítulo**, um **ícone à esquerda(leading)**
e um **ícone à difeita(trailing)**
~~~
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: ListTileListView(),
    ),
  );
}

class ListTileListView extends StatelessWidget {
  const ListTileListView({super.key});

  final List<Map<String, String>> _contatos = [
    {'nome': 'Ana Silva', 'telefone': '11 98765-4321'},
    {'nome': 'Pedro Souza', 'telefone': '21 91234-5678'},
    {'nome': 'Carla Oliveira', 'telefone': '31 99876-5432'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView com ListTile'),
      ),
      body: ListView.builder(
        itemCount: _contatos.length,
        itemBuilder: (context, index) {
          final contato = _contatos[index];
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text(contato['nome']!),
            subtitle: Text(contato['telefone']!),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        },
      ),
    );
  }
}
~~~

## Com posso tornar os itens ``ListTile`` interativos (clicáveis)?
* Para tornar um ``ListTile`` clicável, você pode envolvê-lo com um widget ``InkWell`` ou usar a propriedade ``onTap`` diretamente dentro do ``ListTile``.
* ``InkWell`` adiciona um efeito visual de "**tinta**" ao toque, indicando a interação
~~~
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: InteractiveListTile(),
    ),
  );
}

class InteractiveListTile extends StatelessWidget {
  const InteractiveListTile({super.key});

  final List<String> _nomes = ['Alice', 'Bob', 'Charlie'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListTile Interativo'),
      ),
      body: ListView.builder(
        itemCount: _nomes.length,
        itemBuilder: (context, index) {
          final nome = _nomes[index];
          return ListTile(
            title: Text(nome),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
~~~

## Vantagens de usar ListTile em vez de widgets de texto simples
* Usar o ``ListTile`` oferece diversas vantagens em comparação com a simples combinação de widgets de text(``Text``) para criar itens de lsita. Ele fornece uma **estrutura visual e funcional
predefinida e otimizada** para exibir informações em formato de listra de maneira consistente e fácil de usar
* Vantagens do ``ListTile``:
  * **Estrutura Semântica Clara**: O ``ListTile`` já define espaços para um ``leading``(**elemento à esquerda**, como um ícone ou avatar), um ``title``(**texto principal**)
  , um ``subtitle``(**texto secundário**) e um ``trailing``(**elemento à direita**, coom um ícone ou indicador). Isso torna o código mais **legível e fácil de entender**
  * **Consistência Visual**: AO usar ``ListTile``, você garante uma aparência mais uniforme para todos os itens da sua lista, seguinte as conveções de design de listas em plataformas móveis
  * **Facilidade de Personalização**: Apesar de ter uma estrutura padrão, o ``ListTile`` é altamente personalizável através de suas propriedades. Você pode facilmente adicionar
  ícones, mudar o espaçamento, controlar a densidade visual e muito mais
  * **Interatividade Integrada**: O ``ListTile`` já possui a propriedade ``onTap``(e outras como ``OnLongPress``), facilitando a adição de interativiadde aos itens da lista sem
  precisar envolver cada item em um widget como ``GestureDetector`` ou ``InkWell`` (embora voc~e ainda possa usá-los para personalizações adicionais)

### Exemplo usando texto simples
~~~
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: SimpleTextList(),
    ),
  );
}

class SimpleTextList extends StatelessWidget {
  const SimpleTextList({super.key});

  final List<Map<String, String>> _itens = [
    {'titulo': 'Item A', 'descricao': 'Descrição do item A'},
    {'titulo': 'Item B', 'descricao': 'Descrição do item B'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista com Texto Simples'),
      ),
      body: ListView.builder(
        itemCount: _itens.length,
        itemBuilder: (context, index) {
          final item = _itens[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              children: <Widget>[
                const Icon(Icons.info),
                const SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(item['titulo']!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(item['descricao']!, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward_ios),
              ],
            ),
          );
        },
      ),
    );
  }
}
~~~

### Exemplo usando ``ListTile``
~~~
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: ListTileExampleList(),
    ),
  );
}

class ListTileExampleList extends StatelessWidget {
  const ListTileExampleList({super.key});

  final List<Map<String, String>> _itens = [
    {'titulo': 'Item A', 'descricao': 'Descrição do item A'},
    {'titulo': 'Item B', 'descricao': 'Descrição do item B'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista com ListTile'),
      ),
      body: ListView.builder(
        itemCount: _itens.length,
        itemBuilder: (context, index) {
          final item = _itens[index];
          return ListTile(
            leading: const Icon(Icons.info),
            title: Text(item['titulo']!),
            subtitle: Text(item['descricao']!),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Você clicou em ${item['titulo']}!')),
              );
            },
          );
        },
      ),
    );
  }
}
~~~

## Explicando sobre o método ``generate``
* O ``List<String>.generate`` é um construtor estático da classe ``List`` em Dart que permite criar uma nova lista preenchida com valores gerados dinamicamente
* Ele é particularmente útil quando você precisa criar uma **lista com um número específico de itens**, onde o **valor de cada item segue uma lógica ou um padrão**
  * O método generate recebe **dois argumentos principais**:
    * ``length``: Um **inteiro** que especifica o **número de itens que a lista** deve conter
    * ``generator``: Uma função que **recebe um índice inteiro**(começando com 0 e indo até length -1) e **retorna o valor que deve ser colocado naquela posição específica da lista**
~~~
void main() {
  // Criando uma lista de 5 strings, onde cada string é "Item seguido do índice".
  List<String> listaDeItens = List<String>.generate(5, (index) => 'Item $index');
  print(listaDeItens); // Saída: [Item 0, Item 1, Item 2, Item 3, Item 4]

  // Criando uma lista dos 10 primeiros números pares como strings.
  List<String> listaDePares = List<String>.generate(10, (index) => (index * 2).toString());
  print(listaDePares); // Saída: [0, 2, 4, 6, 8, 10, 12, 14, 16, 18]

  // Criando uma lista de cores com base no índice.
  List<Color> listaDeCores = List<Color>.generate(
    3,
    (index) {
      if (index == 0) {
        return Colors.red;
      } else if (index == 1) {
        return Colors.green;
      } else {
        return Colors.blue;
      }
    },
  );
  print(listaDeCores); // Saída: [Color(0xfff44336), Color(0xff4caf50), Color(0xff2196f3)]
}
~~~

## Como adicionar ícones e outros elementos em um ``ListTile``?
* O ``ListTile`` foi projetado com espaços específicos para adicionar elementos visuais:
  * ``leading``: Um widget a ser exbido no início(lado esquerdo) do ``ListTile``. Geralmente é usado para um ``Icon``, um ``CircleAvatar`` com uma imagem ou letra, ou qualquer outro widget pequeno
  * ``trailing``: Um widget a ser exibido no final(lado direito) do ``ListTile``. Frequentemente usado para ícones como setas de navegação(``Icon.arrow_forward_ios``), interruptores(``Switch``), ou **outros indicadores**
  * ``subtitle``: Embora seja **principalmente** para **texto**, você pode colocar outros widgets pequenos aqui se necessário(embora não seja o uso mais comum)
  * ``title``: Similar ao ``subtitle``, é primariamente para **texto**, mas widgets inline pequenos podem ser incluídos
~~~
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: VisualListTile(),
    ),
  );
}

class VisualListTile extends StatelessWidget {
  const VisualListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListTile com Visuais'),
      ),
      body: ListView(
        children: const <Widget>[
          ListTile(
            leading: Icon(Icons.star, color: Colors.yellow),
            title: Text('Item Favorito'),
            subtitle: Text('Este é um dos seus itens favoritos.'),
            trailing: Icon(Icons.bookmark_border),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/50'),
            ),
            title: Text('Usuário João'),
            subtitle: Text('joao@email.com'),
            trailing: Text('Online', style: TextStyle(color: Colors.green)),
          ),
          ListTile(
            leading: FlutterLogo(size: 40),
            title: Text('Flutter Widget'),
            trailing: SizedBox(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(Icons.edit),
                  SizedBox(width: 8),
                  Icon(Icons.delete, color: Colors.red),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
~~~