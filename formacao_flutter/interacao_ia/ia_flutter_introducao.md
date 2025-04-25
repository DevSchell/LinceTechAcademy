## O que é ``MaterialApp`` e pra que serve?
* ``MaterialApp`` é o widget raiz de aplicativos em Flutter que usam **Material Design** (visual do android moderno). Ele configura o app inteiro: tema, rotas, título, home e etc
~~~
void main() {
  runApp(MaterialApp(
    title: 'Meu App',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: MyHomePage(),
  ));
}
~~~

## Quais parâmetros são importantes no ``MaterialApp``?
* ``title``: **título** do app (aparece em abas de multitarefa)
* ``theme``: tema visual do app (**cores**, **fontes**)
* ``home``: **widget principal** que aparece ao abrir o app
* ``routes``: mapa de **rotas** (**navegação** por nome)
* ``initialRoute``: define qual **rota abrir primeiro**
* ``debugShowCheckedModeBanner``: tira a faixa de "**debug**" (padrão: ``true``)
* 
## O que é Material Design e como ele é usado no Flutter?
* Material Design é um sistema de design criado pelo Google com foco em:
  * Cores consistentes
  * Tipografia clara
  * Animações suaves
  * Componentes visuais reutilizáveis
* No Flutter, tudo gira em torno disso, os botões, menus, cards, barras, tudo vem "de fábrica" seguindo o Material

## Principais widgets do Material Design no Flutter
* ``AppBar``: barra superior com título/ações
* ``Scaffold``: estrutura básica de uma tela
* ``TextField``: campo de texto
* ``ElevatedButton``: botão em relevo
* ``FloatingActingButton``: botão flutuante (canto inferior)
* ``Drawer``: menu lateral
* ``SnackBar``: mensagens no rodapé
* ``Card``: cartão com sombra

## ``Stateless Widgets``
### Limitações dos ``Stateless Widgets``
* Não guardam estados
* Não reagem à mudanças (ex: contadores, texto dinâmico)
* Bom só pra telas fixas ou estáticas
### Ciclo de vida de um ``Stateless Widget``
* Ele possui apenas **um passo:**
  1.``build()`` -> **monta o widget**

## ``Stateful Widgets``
### Limitações dos ``Stateful Widgets``
* Mais **complexos** de gerenciar
* Podem **causar bugs** se o estado for **mal controlado**
* Atualizações em **excesso** com ``setState()`` podem **afetar performance**
### Ciclo de vida de um ``StatefulWidget``
1. ``createState()`` -> **Cria** o estado
2. ``initState()`` -> **inicia** o estado (tipo um "onStart")
3. ``build()`` -> **monta a interface**
4. ``setState()`` -> **atualiza** a interface
5. ``dispose()`` -> **limpa** o estado (tipo "**onDestroy**")

## Como é feito o gerenciamento de estado em ``Stateful Widgets``?
* Usando uma classe de estado (``_MyWidgetState``) com **variáveis internas** e com **método** ``setState()`` para **atualizar a UI** quando algo muda

## Como funciona o ``setState()``?
* Ele avisa o Flutter que algo mudou e precisa reconstruir a tela
~~~
setState(() {
  contador++;
});
~~~
* Tudo dentro do ``setState()`` é reconstruído com os novos valores

## Cuidados no gerenciamento de estado
* Não exagerar no ``setState()`` -> **atualize** só o **necessário**
* **Evite** colocar **lógica** de negócios **dentro** do ``setState()``
* Use ``dispose()`` para **liberar recursos** (ex: **controllers**)
* **Não atualize a UI fora do** ``setState()``

## Diferenças entre ``Stateless`` e ``Stateful``
| **Característica** | ``Stateless`` | ``Stateful``            |
|--------------------|---------------|-------------------------|
| Guarda estado?     | Não           | Sim                     |
| Performance        | Melhor        | Pode cair               |
| Uso ideal          | Telas fixas   | Interação dinâmica      |
| Atualiza UI?       | Não           | Sim, com ``setState()`` |
