## Entendendo a navegação no Flutter
**Imagine seu aplicativo como uma pilha de cartas**. Cada carta representa uma tela(ou **rota**). 
A navegação consiste em **colocar novas cartas** no topo da pilha(**ir para uma nova tela**) ou **remover a carta** do topo(**voltar para a tela anterior**). 
O ``Navigator`` é o componente do Flutter que gerencia essa pilha de rotas

## O que são rotas anônimas no Flutter e como elas funcionam?
* Rotas **anônimas são rotas que não possuem um nome predefinido**. Quando você navega para uma rota anônima, 
**você geralmente cria a tela diretamente no momento da navegação**
, sem se referir a ela por um nome específico

### Como funcionam
* Você usa métodos como ``Navigator.push()`` para adicionar uma nova rota anônima ao topo da pilha. O ``push()`` geralmente recebe um ``MaterialPageRoute`` (ou outro tipo
de ``PageRoute``) que define como uma nova tela será construída e animada.

#### Exemplo de Galeria com rotas anônimas
~~~
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galeria Anônima',
      home: const ListaDeImagens(),
    );
  }
}

class ListaDeImagens extends StatelessWidget {
  const ListaDeImagens({super.key});

  final List<String> imagens = [
    'https://via.placeholder.com/150/FFC107/000000?Text=Imagem+1',
    'https://via.placeholder.com/150/4CAF50/FFFFFF?Text=Imagem+2',
    'https://via.placeholder.com/150/2196F3/FFFFFF?Text=Imagem+3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeria de Imagens'),
      ),
      body: ListView.builder(
        itemCount: imagens.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaImagem(url: imagens[index]),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(imagens[index]),
            ),
          );
        },
      ),
    );
  }
}

class TelaImagem extends StatelessWidget {
  final String url;

  const TelaImagem({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visualizar Imagem'),
      ),
      body: Center(
        child: Image.network(url),
      ),
    );
  }
}
~~~
Nesse exemplo, ao tocar em uma imagem na ``ListaDeImagens``, uma nova tela (``TelaImagem``) é criada e exibida usando ``Navigator.push()`` com um ``MaterialPageRoute``.
Essa rota não tem um nome definido, ela é criada "**anonimamente**" no momento da navegação.

## Quais métodos do ``Navigator`` são mais utilizados e por quê?
Os métodos mais comuns do ``Navigator`` são:
* ``Navigator.push(context, route)``: Adiciona uma nova ``route`` ao topo da pilha. É usado para navegar para uma nova tela
  * Geralmente, ``route`` é uma instância de ``MaterialPageRoute`` (para transições de tela padrão do Material Design) ou ``CupertinoPageRoute`` (para transições no estilo iOS)
* ``Navigator.pop(context, [result])``: Remove a rota atual do topo da pilha. Voltando para a tela anterior. O argumento opcional ``result`` pode ser usado para passar dados
de volta para a tela que iniciou a navegação
* ``Navigator.pushNamed(context, routeName, {arguments})``: Adiciona uma nova rota à pilha, identificando-a pelo ``routeName`` (uma string que você define). O argumento opcional
``arguments`` permite passar dados para a nova rota.
* ``Navigator.popUntil(context, predicate)``: Remove rotas da pilha repetidamente até que o ``predicate``(uma função recebe uma ``Route`` e retorna um booleano) retorne 
``true``. Útil para voltar para uma tela específica em um fluxo mais profundo.
* ``Navigator.pushReplacement(context, newRoute)``: Substitui a rota atual na pilha por uma nova ``newRoute``. 
Isso impede que o usuário volte para a tela anterior usando o botão "voltar". Existe também ``pushReplacementNamed`` para rotas nomeadas

### Porque são utilizados:
* ``push`` e ``pushNamed`` são essenciais para a navegação para novas telas. A escolha entre eles depende se você está usando rotas anônimas ou nomeadas
* ``pop`` é fundamental para permitir que o usuário retorne para a tela anterior
* ``popUntil`` é útil em fluxos complexos onde você precisa voltar para um ponto específico, ignorando as telas intermediárias
* ``pushReplacement`` é improtante em cenários como telas de login ou onboarding onde você não quer que o usuário volte para a tela anterior após concluir o fluxo

## Vantagens e desvantagens de usar rotas anônimas
### Vantagens
* **Simplicidade para casos simples:** Para navegar entre poucas telas ou em fluxos lineares simples, o uso de rotas anônimas pode ser mais direto e com menos código inicial.
* **Flexibilidade na criação de rota:** Você pode criar a instância da tela e configurar seus parâmetros diretamente no momento da navegação.

### Desvantagens
* **Dificuldade de reutilização:** se você precisa navegar para a mesma tela de vários lugares diferentes, 
você terá que repetir o código de construção da rota (o ``MaterialPageRoute``).
* **Acoplamento:** O código que inicia a navegação fica acoplado à construção da tela de destino. 
Qualquer mudança na forma como a tela é construída pode exigir alterações em vários locais do código
* **Dificuldade com rotas profundas e passagem de dados complexa:** Em aplicativos maiores com muitos fluxos e passagem de dados mais elaborada, gerenciar 
rotas anônimas pode se tornar confuso e propenso à erros.
* **Limitações em navegação programática:** Navegar para uma tela específica por um identificador (uma string, por exemplo) é mais difícil com rotas anônimas

## O que são rotas nomeadas em Flutter e como elas funcionam?
* Rotas **nomeadas** são **rotas** que **possuem um nome único associado à elas** (uma string). Em vez de construir a tela diretamente no momento da 
navegação, **você se refere à ela pelo seu nome**. 
A associação entre o nome da rota e o widget da tela é definida centralmente no seu aplicativo.

### Como funcionam:
* Você define um mapa de rotas na propriedade routes do seu ``MaterialApp`` (ou ``WidgetsApp``).
* Este mapa associa cada nome de rota à uma função (``WidgetBuilder``) que sabe como construir o widget da tela correspondente. 
Para navegar para uma rota nomeada, você usa ``Navigator.pushNamed()`` passando o nome da rota.
#### Exemplo de Fluxo com times brasileiros usando rotas nomeadas e parâmetros
~~~
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Times Brasileiros',
      initialRoute: '/',
      routes: {
        '/': (context) => const ListaTimes(),
        '/detalhes': (context) => const DetalhesTime(),
      },
    );
  }
}

class ListaTimes extends StatelessWidget {
  const ListaTimes({super.key});

  final List<String> times = ['Flamengo', 'Corinthians', 'Palmeiras', 'Grêmio'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Times'),
      ),
      body: ListView.builder(
        itemCount: times.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(times[index]),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/detalhes',
                arguments: times[index], // Passando o nome do time como parâmetro
              );
            },
          );
        },
      ),
    );
  }
}

class DetalhesTime extends StatelessWidget {
  const DetalhesTime({super.key});

  @override
  Widget build(BuildContext context) {
    final String? nomeTime = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(
        title: Text(nomeTime ?? 'Detalhes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              nomeTime != null ? 'Detalhes do ${nomeTime.toUpperCase()}' : 'Nenhum time selecionado',
              style: const TextStyle(fontSize: 20),
            ),
            // Aqui você poderia exibir mais detalhes do time
          ],
        ),
      ),
    );
  }
}
~~~
Neste fluxo:
1. A tela inicial (``ListaTimes``) exibe uma lsita de times
2. Ao tocar em um time, ``Navigator.pushNamed()`` é chamado para navegar para a rota ``/detalhes``. O nome do time é pasado como ``argumets``
3. Na tela ``DetalhesTime``, o nome do time é acessado usando ``ModalRoute.of(context)?.settings.arguments``.

## Como navegar para uma rota nomeada específica?
* Você navega para uma rota nomeada específica usando o método ``Navigator.pushNamed(context, routeName, {arguments})``.
  * ``context``: O ``BuildContext`` da sua árvore de widgets
  * ``routeName``: Uma string que corresponde ao nome da rota que você definiu no seu mapa de ``routes``
  * ``arguments``(opcional): Um objeto que você pode passar para a tela de destino. Este objeto pode ser um valor simples, um mapa ou uma instância de uma classe

## Quais vantagens de usar rotas nomeadas em relação às rotas anônimas?
* **Reutilização:** Você pode navegar para a mesma tela de múltiplos lugares no seu aplicativo apenas referenciando o seu nome
* **Desacoplamento:** O código que inicia a navegação não precisa saber como a tela de destino é construída. A responsabilidade de construir 
a tela reside no mapa de ``routes`` .
* **Navegação programática facilitada:** Você pode armazenar os nomes das rotas como constantes e usar essas constantes para navegar, tornando o código mais legível e menos propenso à erros de digitação. 
Você pode também usar esses nomes para navegação dinâmica baseada em configurações ou dados
* **Facilidade de gerenciamento em aplicativos grandes:** Centralizar a definição de rotas torna mais fácil entender o fluxo de navegação do seu aplicativo e realizar alterações.
* **Melhor suporte para testes:** Rotas nomeadas facilitam a criação de testes de navegação, poos você pode se refetir às telas pelos seus nomes.
* **Deep linking:** Rotas nomeadas são essenciais para implementar deep linking, onde links externos ou notificações podem abrir telas específicas do seu aplicativo diretamente.

## Como posso definir rotas nomeadas em meu aplicativo Flutter?
* Você define rotas nomeadas na propriedade ``routes`` do widget raiz do seu aplicativo, geralmente dentro do ``MaterialApp`` (ou ``WidgetApp``). 
A propriedade ``routes`` espera um mapa(``Map<String, WidgetBuilder>``).
  * **Chave:** Uma string que representa o nome da rota (por exemplo, ``/``, ``/login``, ``/perfil``).
  * **Valor:** Uma função (``WidgetBuilder``) que recebe um ``BuildContext`` e retorna o widget da tela correspondente
  ~~~
  MaterialApp(
  title: 'Meu Aplicativo',
  initialRoute: '/', // Rota inicial
  routes: {
    '/': (context) => const HomePage(),
    '/login': (context) => const LoginPage(),
    '/perfil': (context) => const PerfilPage(),
    '/detalhes': (context) => const DetalhesScreen(),
    },
  );
  ~~~
  
## Como posso acessar os parâmetros passados em uma rota nomeada?
* Para acessar os parâmetros usando o argumento ``arguments`` em ``Navigator.pushNamed()``, você usa o método ``ModalRoute.of(context)?.settings.arguments`` dentro do build
da tela de destino. O tipo do valor retornado será o mesmo tipo do objeto que você pasosu como ``arguments``. Portanto, é importante fazer o casting correto para o tipo esperado
~~~
class DetalhesScreen extends StatelessWidget {
  const DetalhesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamic argumentos = ModalRoute.of(context)?.settings.arguments;

    // Verificar o tipo de 'argumentos' e fazer o casting apropriado
    if (argumentos is String) {
      final String mensagem = argumentos;
      return Scaffold(
        appBar: AppBar(
          title: const Text('Detalhes'),
        ),
        body: Center(
          child: Text('Mensagem: $mensagem'),
        ),
      );
    } else if (argumentos is Map<String, dynamic>) {
      final String nome = argumentos['nome'];
      final int idade = argumentos['idade'];
      return Scaffold(
        // ... exibir nome e idade
      );
    }
    // ... lidar com outros tipos de argumentos ou caso 'argumentos' seja nulo
    return const Scaffold(
      body: Center(
        child: Text('Nenhum detalhe fornecido.'),
      ),
    );
  }
}
~~~

## Como posso tornar os parâmetros opcionais em uma rota nomeada?
* Tornar parâmetros opcionais em rotas nomeadas envolve principalmente a forma como você lida com os argumentos na tela de destino. 
Ao acessar ``ModalRoute.of(context)?.settings.arguments``, você precisará verificar se o valor existe(não é nulo) antes de usá-lo.
* Se você estiver passando um mapa de argumentos, você pode verificar se uma chave específica existe no mapa antes de acessar seu valor
~~~
class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final String nome = args?['nome'] ?? 'Visitante'; // Se 'nome' não existir, usa 'Visitante'
    final int? idade = args?['idade']; // 'idade' pode ser nulo

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Nome: $nome'),
            if (idade != null) Text('Idade: $idade'),
          ],
        ),
      ),
    );
  }
}

// Navegação com parâmetro opcional:
Navigator.pushNamed(context, '/perfil', arguments: {'nome': 'Carlos'});
// Navegação sem o parâmetro opcional 'idade':
Navigator.pushNamed(context, '/perfil', arguments: {'nome': 'Ana'});
// Navegação sem nenhum parâmetro (usará o valor padrão 'Visitante'):
Navigator.pushNamed(context, '/perfil');
~~~

## Quais cuidados devo ter ao usar as rotas?
* **Consistência nos nomes das rotas:** Use uma convenção de nomenclatura clara e consistente para suas rotas nomeadas. Isso facilitará a manutenção e a compreensão do fluxo de navegação.
* **Casting correto dos argumentos:** Ao acessar os argumentos passados, sempre faça o casting para o tipo esperado. Se o tipo for incorreto, seu aplicativo pode gerar erros em tempo de execução. Use verificações do tipo (``is``) ou use tratamento de erros (``try-catch``) para evitar problemas
* **Gerenciamento do estado:** Lembre-se de como a navegação afeta o estado dos seus widgets. Ao voltar para uma tela, o estado pode ter sido perdido se você não estiver usando um gerenciamento de estado adequado (como **Provider**, **Riverpod**, **BLoC**, etc)
* **Performance:** Navegar para telas complexas pode levar tempo. Considere usar indicadores de carregamento ou otiimizar a construção das suas telas para proporcionar uma boa experi~encia ao usuário.
* **Navegação inesperada:** O botão “voltar” nativo do sistema operacional pode levar o usuário de volta para telas anteriores na pilha de rotas. Certifique-se de que esse comportamento seja o desejado em todos os fluxos do seu aplicativo. Em alguns casos (como após um logout), você pode querer impedir que o usuário volte para telas protegidas usando ``Navigator.pushReplacement()`` ou ``Navigator.popUntil()``
* **Tratamento de rotas inválidas:** Se você usar ``Navigator.pushNamed()`` com um nome de rota que não foi definido no seu mapa de ``routes``, o Flutter exibirá uma tela de erro. Em aplicativos maiores, pode ser útil ter um tratamento mais amigável para toras inválidas, talvez exibindo uma tela de “Página não encontrada” ou redirecionando para uma rota padrão.
* **Passagem de dados:** Evite passar grandes quantidades de dados como argumentos de rota, especialmente se esses dados puderem ser obtidos novamente na tela de destino de forma eficiente. Passar muitos dados pode impactar a performance da navegação. Considere usar mecanismos de gerenciamento de estado para compartilhar dados entre telas.

## Quais as boas práticas ao usar rotas em Flutter?
* Adotar boas práticas ao usar rotas no Flutter pode tornar seu código mais organizado, legível e fácil de manter:
  * **Utilize rotas nomeadas para navegação compelxa e reutilizável:** Para aplicativos com múltiplos fluxos, navegação profunda ou telas que são acessadas de vários lugares, as rotas nomeadas oferecem uma estrutura mais clara e facilitam a reutilização do código de navegação
  * **Centralize a definição de rotas:** Mantenha no mapa de ``routes`` no seu widget raiz (``MaterialApp`` ou ``WidgetsApp``). Isso fornece um ponto único de referência para todas as rotas do seu aplicativo.
  * **Use constantes para os nomes das rotas:** Defina os nomes das rotas como constantes estáticas dentro dass classes das tuas telas ou em um arquivo dedicado. Isso evita erros de digitação e facilita a refatoração.
  ~~~
  class TelaDetalhes {
  static const routeName = '/detalhes';
  // ...
    }

    // No seu MaterialApp:
    MaterialApp(
    routes: {
    TelaDetalhes.routeName: (context) => const TelaDetalhes(),
    },
    );

    // Para navegar:
    Navigator.pushNamed(context, TelaDetalhes.routeName, arguments: /* ... */);
  ~~~
  * **Crie classes de argumentos específicas:** Se você precisar passar múltiplos parâmetros entre telas usando rotas nomeadas, crie uma classe específica para esses argumentos. Isso torna o código mais seguro (****type-safe****) e mais fácil de entender.
  * **Seja explícito com os tipos de argumentos:** Ao acessar os argumentos, faça o casting oexplícito para o tipo esperado e inclua verificações de tipo ara evitar erros.
  * **Use ``Navigator.canPop(context)`` antes de chamar ``Navigator.pop(context)``:** Isso verifica se há alguma rota anterior na pilha antes de tentar removê-la, evitando erros se você estiver na primeira tela
  * **Considere usar um gerenciador de rotas mais avançado para aplicativos complexos:** Para aplicativos muito grandes com navegação complexa (por exemplo, rotas aninhadas, navegação condicional), considere usar um pacote de terceiros como ``go_router`` ou ``fluro``. Esses pacotes oferecem funcionalidades mais avançadas e podem simplificar o  gerenciamento de rotas complexas.
  * **Mantenha a lógica de navegação separada da lógica de UI:** Evite colocar a lógica de navegação diretamente dentro dos widgets de UI (como dentro de um ``onPressed`` de um botão). Em vez disso, considere usar funções separadas ou um serviçop de navegação para encapsular essa lógica, tornando seus widgets mais focados na apresentação.
  * **Documente suas rotas:** Em aplicativos maiores, pode ser útil documentar o propósito de cada rota e os parâmetros esperados