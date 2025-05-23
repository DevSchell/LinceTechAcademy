## O que é gerenciamento de estados em Flutter?
* Gerenciamento de estado = **controlar e compartilhar informações** que mudam ao longo do tempo dentro do app
* Exemplo
  * Se um botão está ativado ou desativado
  * O nome do usuário
* Por que é importante?
  * Mantém o app **organizado e eficiente**

## Qual a diferença entre estado global e estado local?
* Estado Local -> Só afeta um widget específico
  * Ex: contador que só muda dentro de um widget
* Estado Global -> Compartilhado entre vários widgets ou até pelo app todo.
  * Ex: dados do usuário logado
Dica: Para estados pequenos -> ``setState()``. Para estados complexos -> ``Provider`` ou outro **gerenciador**

## Quais vantagens de usar um gerenciador de estado
* **Organização** -> separa lógica de UI
* **Reutilização** -> estado compartilhado facilmente
* **Eficiência** -> evite reconstruções desnescessárias
* **Escalabilidade** -> facilite crescer o app sem virar bagunça

## Como o ``Provider`` ajuda a evitar a reconstrução desnecessária?
* ``Provider`` **escuta** apenas as mudanças relevantes
* Só quem **usa** o estado é reconstruído. O resto permanece igual
~~~
Consumer<Contador>(
  builder: (context, contador, child) => Text('${contador.valor}'),
)
~~~
_> Só o ``Text`` **vai** recosntruir quando o valor mudar

## Como o Provider simplifica o gerenciamento de estados?
* Não precisa passar estado manualmente entre os widgets (prop drilling)
* Centraliza a lógica em uma classe (``ChangeNotifier``)
* Facilita escutar e notificar mudanças

## O que é o ``ChangeNotifierProvider``?
* É um provider especializado para classes que estendem ``ChangeNotifier``
* Ele
  * Crie e fornece a instância do estado
  * Notifica os widgets que usam esse estado quando algo muda
* Fluxo:
  1. ``ChangeNotifier`` -> contém o estado e ``notifyListeners()``
  2. ``ChangeNotifierProvider`` -> fornece essa classe pros widgets
  3. ``Consumer`` ou ``Provider.of()`` -> acessam e reagem às mudanças

## Como fornecer um ``ChangeNotifier`` para a árvore de widgets?
* Dentro da sua classe que estende ``ChangeNotifier``, use ``notifyListeners()``
~~~
class Contador with ChangeNotifier {
  int _valor = 0;

  int get valor => _valor;

  void incrementar() {
    _valor++;
    notifyListeners();
  }
}
~~~
_> Sempre que ``incrementar`` for chamado, os widgets que consomem ``Contador`` serão atualizados

## O que é ``Consumer``?
* ``Consumer`` é um widget que:
  * Acessa o estado de um ``Provider``
  * Reconstrói só a parte da UI que depende desse estado
  ~~~
  Consumer<Contador>(
  builder: (context, contador, child) => Text('${contador.valor}'),
    )
  ~~~
  
## Como o ``Consumer`` ajuda a reconstruir apenas os widgets que dependem do estado?
* ``Consumer`` isola a reconstrução
* Só o ``builder`` do ``Consumer`` é reconstruído, não o widget inteiro
  * Isso **economiza performance**

## Como posso usar o ``Consumer`` para acessar o estado do ``ChangeNotifierProvider``?
~~~
Consumer<Contador>(
  builder: (context, contador, child) {
    return ElevatedButton(
      onPressed: contador.incrementar,
      child: Text('Valor: ${contador.valor}'),
    );
  },
);
~~~
_> ``contador`` aqui é a instância fornecida pelo ``ChangeNotifierProvider``

## Diferença entre usar ``Consumer`` e ``Provider.of()``
### Consumer
* É um **widget** que você coloca na sua árvore de widgets
* Serve para **reconstruir só aquela parte da UI** quando o estado mudar
* É a forma mais segura e eficiente para exibir dados ou reagir à mudanças
~~~
Consumer<Contador>(
  builder: (context, contador, child) {
    return Text('${contador.valor}');
  },
);
~~~
_> Somente o ``Text`` vai reconstruir quando o ``valor`` mudar

### ``Provider.of()``
* É um **método** que você chama no código, normalmente dentro da ``build`` ou em funções
* Pode **escutar mudanças** ou não, dependendo do parâmetro ``listen``
~~~
Provider.of<Contador>(context);
~~~
_> Se usar assim, vai escutar mudanças e reconstruir o widget inteiro onde foi chamado

~~~
Provider.of<Contador>(context, listen: false);
~~~
_> Se usar assim, não escuta mudanças, ou seja, não reconstrói nada automaticamente

### Quando usar o ``Provider.of()``?
* Quando só quer **chamar um método ou acessar dados uma única vez**, sem precisar atualizar UI
~~~
ElevatedButton(
  onPressed: () {
    Provider.of<Contador>(context, listen: false).incrementar();
  },
  child: Text('Incrementar'),
)
//Aqui só chama o método "incrementar" sem reconstruir o botão
~~~
### Resumo
* Quer mostrar um valor e reconstruir só aquela parte? - Use ``Consumer``
* Quer chamar um método ou acessar um dado, sem reconstrução? -  Use ``Provider.of(context, listen: false)``

## Como otimizar o uso do ``Consumer``?
* Use ``Consumer`` apenas na parte da UI que precisa do estado
* **Evite envolver widgets grandes** com ``Consumer``
* Se só precisa chamar um método (sem construção):
  * Use ``Provider.of(context, listen: false)``
~~~
Column(
  children: [
    Consumer<Contador>(
      builder: (context, contador, child) => Text('${contador.valor}'),
    ),
    ElevatedButton(
      onPressed: () => Provider.of<Contador>(context, listen: false).incrementar(),
      child: Text('Incrementar'),
    )
  ],
)
~~~
_> Só ``Text`` reconstrói. O ``ElevatedButton`` não