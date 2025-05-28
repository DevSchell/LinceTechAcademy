# 1. Quais são os diferentes tipos de dados que podem ser persistidos em um aplicativo Flutter?

- Em um aplicativo Flutter, você pode persistir uma variedade de tipos de dados
- Desde os mais simples, até estruituras mais complexas. Aqui estão os principais:
    - **Tipos de Dados Primitivos**
        - `int`
        - `double`
        - `bool`
        - `String`
        - `List<String>`
    - **Estruturas de dados mais complexas**
        - **JSON** (**JavaScript Object Notation):** É um formato de texto utilizado para troca de dados. Conseguimos converter para um `Map<String, dynaimc>` quando queremos trabalhar com ele em Dart.
        - **Objetos Customizados:** Você pode ter classes Dart próprias (`Produto`, `Pedido`) e persistir suas instâncias. Isso geralmente envolve resialização (converter o objeto em um formato que pode ser armazenado, como JSON ou binário) e desserialização (converter de volta ao objeto)
        - **Bytes(Dados Binários):** Para dados como imagens, vídeos ou arquivos, você pode persistir os bytes brutos

## Onde eles são persistidos?

- A escolha do tipo de armazenamento depende do volume e da complexidade dos dados:
    - **Shared Preferences:** Ótimo para dados simples (`int`, `double`, `bool`, `String`, `List<String>`)
    - **Armazenamento de Arquivos:** Para arquivos maiores ou dados que precisam ser acessados diretamente (como imagens baixadas)
    - **Bancos de Dados Locais (SQLite/sembast/Hive):** Para dados que precisam ser sincronizados entre dispositivos e acessados online

# 2. O que é o pacote `SharedPreferences` e como funciona?

- O pacote `shared_preferences` no Flutter é uma solução simples e leve para **persistir pequenas quantidades de dados de chave-valor** no dispositivo do usuário. Pense nele como um dicionário simples onde você associa um valor à uma “chave” (um nome único, com um **ID**) e pode recuperar esse valor mais tarde usando a mesma chave.

## Como ele funciona?

1. **Chave-Valor:** A ideia central é que você armazena seus dados como pares de “chave-valor”. **A chave** é sempre uma `String` (o nome que você dá ao dado) e o valor é o dado em sí (pode ser `int`, `double`, `bool`, `String` ou `List<String>`).

### Exemplos

- `'nomeUsuario' : ‘João’`
- `'idade' : 30`
- `“temaEscuro” : true`
- `“itensCarrinho” : [”banana” , “Maçã”]`

1. **Armazenamento Interno:** Por baixo dos panos, o `shared_preferences` utiliza os mecanismos nativos de persistência de dados de cada plataforma:
    - No **Android**, ele usa o `SharedPreferences` da plataforma Android (salvo como um arquivo XML)
    - No **iOS,** ele usa o ****`NSUserDefaults` da plataforma iOS (salvo como um arquivo `.plist`
    - Na **Web**, ele usa o `localStorage` do navegador
- O pacote `shared_preferences` abstrai essa diferença, permitindo que você use uma API única em Flutter para todas as plataformas

1. **Assíncrono:** Todas as operações com `shared_preferences` (salvar, ler, remover) são **assíncronas.** Isso significa que elas retornam um `Future<bool>` ou `Future<void>`, pois o processo de leitura/escrita no disco leva um tempo e não queremos bloquear a interface do usuário. Você precisará usar `await` para esperar a conclusão dessas operações

### Fluxo básico de uso

1. **Adicionar dependência:** Adicione `shared_preferences` ao seu arquivo `pubspec.yaml`.
2. **Obter Instância:** Use `SharedPreferences.getInstance()` para obter uma instância do `SharedPreferences`. Como é uma operação assíncrona, use `await`.
3. **Salvar Dados:** Use métodos como `setString()`, `setInt()`, `setBool()`, etc. para salvar os dados
4. **Ler Dados:** Use métodos como `getString()`, `setString()`, `setBool()`, etc. para ler os dados
5. **Remover Dados:** Use `remove()` para deletar um par chave-valor específico ou `clear()` para apagar tudo

# 3. Quais limtações do SharedPreferences em termos de armazenamento de dados?

- Embora o `Shared Preferences` seja muito útil, ele tem algumas limitações importantes que você deve conhecer:
    1. **Tipos de dados Limitados:** Ele só pode armazenar tipos de dados primitivos: `int`, `double`, `bool`, `String` e `List<String>`. Você não pode **armazenar objetos complexos** (como uma lista de objetos `Produto` diretamente) ou dados binários (imagens, vídeos). Para isso você teria que serializar seus objetos complexos para uma `String` (geralmente JSON) antes de salválos, e depois desserializá-lo ao ler
    2. **Pequenas Quantidades de Dados:** O `Shared Preferences` é projetado para **pequenas quantidades de dados**. Ele não é um banco de dados e não é otimizado apra armazenas centenas ou milhares de registros. Salvar muitos dados pode afetar o desempenho do seu aplicativo e até mesmo causar problemas de lentidão na inicialização
    3. **Sem capacidades de Consulta:** Não há como fazer consultas complexas (ex: “me dê todos os usuários com idade maior que 30”). Você só pode recuperar dados pela sua chave exata. Se precisar de consultas, um banco de dados local como **SQLite** (com o pacote `sqflite`) ou **Hive/sembast** seria mais apropriado
    4. **Não otimizado para Desempenho de Leitura/Escrita:** Embora seja rápido para pequenas operações, não é a melhor escolha para situações onde você precisa ler e escrever dados muito frequentemente ou em alta velocidade
    5. **Não é seguro para dados sensíveis:** Os dados armazenados no `Shared Preferences` não são criptografados por padrão. Embora eles não sejam facilmente acessíveis por outros aplicativos no dispositivo, eles não sejam facilmente acessíveis por outros aplicativos no dispositivo, les podem ser acessados se o dispositivo for “rooted” (Android) ou “jailbroker” (iOS). **Nunca armazene informações sensíveis** como senhas, tokens de API ou informações financeiras no `Shared Preferences` sem alguma forma de criptografia adicional
    6. **Sem gerenciamento de Migração de Schema:** Se a estrutura dos seus dados mudar (ex: você adiciona um novo campo à um objeto que você serializa para JSON e salva), o `Shared Preferences` não possui um mecanismo integrado para migração. Você precisaria gerenciar isso manualmente no seu código.
- **Em resumo:** Use `Shared Preferences` para configurações de usuário (tema, idioma, estado de login simples), pequenas flags ou caches de dados muito pequenos. Para qualquer coisa mais robusta, considere bancos de dados locais.

# 4. Quando devo usar SharedPreferencese ao invés de um BD?

- Use `SharedPreferences` quando:
    - Você precisa **armazenar pequenos volumes** de dados
    - Os dados são de **tipos primitivos** (`int`, `double`, `bool`, `String`, `List<String>`)
    - Os dados são **configurações do usuário** (ex: preferência de tema claro/escuro, idioma, lembre-se de mim para login, notificações ativadas/desativadas
    - Você precisa de um **cache simples** para dados que não exigem consultas complexas e são pequenos
    - A **persistência é temporária** e não é crítica para a integridade dos dados do aplicativo

## Quando não usar, e considerar usar um BD?

- **Para dados estruturados ou grandes volumes de dados**
    - Bancos de **Dados Locais** (sqflite, Hive, sembast): Se você precisa de tabelas, relacionamentos, consultas compelxas, ou vai armazenar centenas/milhares de registros (listas de produtos, históricos de pedidos, contatos)
- Para **arquivos grandes**:
    - **Armazenamento de Arquivos**(`path_provider`, `dart:io`): Para imagens, víudoes, documentos, ou qualquer tipo de arquivo grande
- Para **dados sensíveis** que precisam de **segurança robusta**:
    - **Flutter Secure Storage:** Para armazenar senhas, tokens de autenticação ou outras informações altamente sensíveis de forma criptografada e segura
- Para dados que precisam de **sincronização na nuvem** ou **acesso de múltiplos dispositivos**:
    - **Firebase Firestore/Realtime Database, Supabase:** Se seus dados precisam estar disponíveis online, serem sincronizados em tempo real entre diferentes dispositivos ou exigir autenticação de usuário.

# Como posso lidar com erros ao usar SharedPreferences?

- As operações com `SharedPreferences` geralmente não lançam exceções diretamente para falhas comuns (como tentar ler uma chave que não existe), mas é importante considerar como lidar com cenários onde a operação pode falhar:

## **1. Lidando com Chaves Inexistentes (leitura):**

- Quando você tenta ler uma chave que não foi definida, os métodos de leitura (`getString`, `getInt`, etc) retornarão `null` (para `String`, `List<String>`) ou um valor padrão (para `int`, `double`, `bool` se você usar o operador `??`)

```dart
import 'package:shared_preferences/shared_preferences.dart';

Future<void> lerDados() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Tentando ler uma chave que pode não existir
  String? nomeUsuario = prefs.getString('nomeUsuario');
  bool temaEscuro = prefs.getBool('temaEscuro') ?? false; // Valor padrão 'false' se não existir

  if (nomeUsuario != null) {
    print('Nome do usuário: $nomeUsuario');
  } else {
    print('Nome do usuário não encontrado. Usando valor padrão ou sem nome.');
  }

  print('Tema escuro ativado: $temaEscuro');
}
```

- **Explicação:** O uso do `??` ( operador “**if null**”) é a forma mais comum e limpa de dar com valores `null` ao ler. Ele fornece um valor padrão caso o valor lido seja `null`

## 2. Tratamento de Exceções (Operações assíncronas)

- Embora raro, operações assíncronas como `SharedPreferences.getInstance()` ou as operações de `set` podem, em teoria, falhar devido à problemas no sistema de arquivos ou permissões. Você pode envolver essas chamadas em um bloco `try-catch`

```dart
import 'package:shared_preferences/shared_preferences.dart';

Future<void> salvarDadosComSeguranca() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool sucesso = await prefs.setString('chaveTeste', 'valorTeste');
    if (sucesso) {
      print('Dados salvos com sucesso!');
    } else {
      print('Falha ao salvar dados (erro desconhecido ou problema de escrita).');
    }
  } catch (e) {
    print('Ocorreu um erro ao acessar SharedPreferences: $e');
    // Você pode mostrar uma mensagem ao usuário, logar o erro, etc.
  }
}
```

- **Explicação:** O `try-catch` é uma boa prática para operações que interagem com o sistema de arquivos ou recursos externos, pois podem lançar exceções. As operações de `set` (`setString`, `setBool`, etc) retornam um `Future<bool>`,  indicando se a escrita foi bem-sucedida ou não. É sempre bom verificar esse retorno.

## 3. Validação de dados

- Se você estiver salvando dados que podem vir de entrada do usuário, é importante validar eses dados antes de salvá-los, independentemente do `SharedPreferences`.

# 6. Quais são as melhores práticas para usar SharedPreferences?

- Para usar `SharedPreferences` de forma eficiente e evitar problemas, siga estas melhores práticas:
    1. **Use para pequenos volumes de dados:** Reforce este ponto! Não tente usar `SharedPreferences` como um banco de dados. Ele é para **configurações** e **flags**
    2. **Não bloqueia a UI:**  Lembre-se que todas as operações são assíncronas. Use `await` corretamente e evite chamadas síncronas que possam congelar sua interface de usuário. Chame `SharedPreferences.getInstance()` apenas uma vez. preferencialmente no `initState` de um widget ou no início do aplicativo
    3. **Centralize o acesso:** Crie uma classe utilitária ou um serviço para encapsular toda a lógica de acesso ao `SharedPreferences`. Isso torna seu código mais organizado, fácil de manter e testar

        ```dart
        import 'package:shared_preferences/shared_preferences.dart';
        
        class AppPreferences {
          static SharedPreferences? _prefs;
        
          static Future<void> init() async {
            _prefs = await SharedPreferences.getInstance();
          }
        
          static String? getUserName() {
            return _prefs?.getString('userName');
          }
        
          static Future<bool>? setUserName(String name) {
            return _prefs?.setString('userName', name);
          }
        
          static bool getThemeMode() {
            return _prefs?.getBool('themeMode') ?? false; // Padrão: claro
          }
        
          static Future<bool>? setThemeMode(bool isDarkMode) {
            return _prefs?.setBool('themeMode', isDarkMode);
          }
        
          // Adicione mais métodos para outras preferências
        }
        
        // No seu main.dart (ou em algum ponto de inicialização):
        // Future<void> main() async {
        //   WidgetsFlutterBinding.ensureInitialized();
        //   await AppPreferences.init(); // Inicializa SharedPreferences
        //   runApp(MyApp());
        // }
        
        // Em seu widget:
        // String? userName = AppPreferences.getUserName();
        // AppPreferences.setThemeMode(true);
        ```

    4. **Chaves Constantes:** Define suas chaves de `SharedPreferences` como constantes estáticas para evitar erros de digitação e tornar seu código mais robusto

        ```dart
        class PrefKeys {
          static const String THEME_MODE = 'themeMode';
          static const String USER_NAME = 'userName';
          static const String IS_LOGGED_IN = 'isLoggedIn';
          // ...
        }
        
        // Uso:
        // prefs.setBool(PrefKeys.THEME_MODE, true);
        // bool? isDarkMode = prefs.getBool(PrefKeys.THEME_MODE);
        ```

    5. **Evite múltiplas chamadas `getInstance()`:** Chamar `SharedPreferences.getInstrance()` repetidamente é ineficiente. Obtenha a instância uma vez e reutilize-a. A abordagem com a classe utilitária acima ajuda nisso
    6. **Não armazene dados sensíveis:** Nunca use `SharedPreferences` para senhas, tokens de API ou informações financeiras sem criptografia adicional (e mesmo assim, Flutter Secure Storage é geralmente a melhor opção para isso)

# Consumer

- O Consumer é um widget do pacote `provider` em Flutter. Ele é usado para “**consumir**” dados de um `Provider` e reconstruir (atualizar) a parte da sua interface de usuário que depende desses dados, **apenas quando esses dados mudam**.

## Por que usar o `Consumer`?

- Em Flutter, a reconstrução (redesenho) de widgets é a forma como a interface do usuário é atualizada. Quando você usa `setState` em um `StatefulWidget`, o widget inteiro e seus filhos são reconstruídos.
- Com o `Provider`, você quer evitar reconstruções desnecessárias para melhorar o desempenho
- O `Consumer` resolve isso. Ele permite que você “ouça” as mudanças em um `Provider` e **somente o `Consumer` e seus filhos que realmente precisam dos dados serão reconstruídos**, e não toda a árvore de widgets acima dele.

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 1. O Modelo/ChangeNotifier: Onde os dados residem e notificam mudanças.
class ContadorModel with ChangeNotifier {
  int _valor = 0; // Estado privado
  int get valor => _valor; // Getter público

  void incrementar() {
    _valor++;
    notifyListeners(); // Avisa aos Consumers que o valor mudou
  }
}

// 2. O Provider: Fornece o modelo para a árvore de widgets.
// Geralmente colocado acima dos widgets que precisam acessar o modelo.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider( // Fornece o ContadorModel
        create: (context) => ContadorModel(),
        child: MinhaTela(), // Onde vamos usar o Consumer
      ),
    );
  }
}

// 3. O Consumer: Onde você "consome" os dados do Provider.
class MinhaTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exemplo Consumer')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Você clicou este número de vezes:',
              style: TextStyle(fontSize: 18),
            ),
            Consumer<ContadorModel>( // <ContadorModel> especifica qual tipo de Provider estamos consumindo
              builder: (context, contadorModel, child) {
                // O 'builder' é a função que é chamada para construir a UI.
                //
                // context: O BuildContext do widget.
                //
                // contadorModel: A instância do seu ContadorModel (o objeto que você quer).
                //                 É através dela que você acessa os dados e métodos.
                //
                // child: Um widget opcional que pode ser passado para o Consumer
                //        e que NÃO precisa ser reconstruído quando os dados mudam.
                //        Se você tiver uma parte da UI dentro do Consumer que é estática,
                //        passar como 'child' pode otimizar o desempenho.
                //        (Neste exemplo, não temos um 'child' útil, mas é importante saber)
                return Text(
                  '${contadorModel.valor}', // Acessando o valor do ContadorModel
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aqui, usamos Provider.of<ContadorModel>(context, listen: false)
                // para acessar o método 'incrementar'. O 'listen: false' é crucial
                // porque não queremos que este botão se reconstrua quando o valor
                // do contador muda, apenas queremos chamá-lo.
                Provider.of<ContadorModel>(context, listen: false).incrementar();
              },
              child: Text('Incrementar'),
            ),
          ],
        ),
      ),
    );
  }
}
```

**Explicação Detalhada do `Consumer`:**

- **`Consumer<TipoDoProvider>`:** Você especifica o tipo do Provider que você quer consumir (ex: `ContadorModel`). Isso garante que o `Consumer` saiba qual objeto buscar na árvore de widgets.
- **`builder: (context, instanciaDoProvider, child) { ... }`:** Esta é a função principal do `Consumer`. Ela será chamada toda vez que o `ChangeNotifier` (seu `ContadorModel` neste caso) notificar que houve uma mudança (`notifyListeners()`).
    - `context`: O `BuildContext` padrão.
    - `instanciaDoProvider`: **Esta é a mágica!** É aqui que você recebe a instância do seu `ContadorModel` (ou qualquer outro tipo de Provider que você esteja consumindo). Você pode então acessar suas propriedades (ex: `instanciaDoProvider.valor`) e métodos.
    - `child`: Um argumento opcional para otimização. Se você tiver partes da UI dentro do `Consumer` que não dependem do estado do `Provider` e, portanto, não precisam ser reconstruídas, você pode passá-las para o `Consumer` através do `child` e reutilizá-las no `builder`.

## Quando usar `Consumer` ou `Provider.of<T>(context)`?

- **`Consumer`:** Use quando você precisa **reconstruir uma parte da sua UI baseada nas mudanças** de um `Provider` Ele é mais performático porque isola a reconstrução apenas para a parte que precisa
- **`Provider.of<T>(context, listen: false)`:** Use quando você **precisa apenas acessar um método** do `Provider` ou um valor que não causa reconstrução (ex: chamando `incrementar()` de um botão). O `listen: false` é crucial para evitar reconstruções desnecessárias quando o valor do `Provider` muda

# Provider

- O `Provider` é como uma “loja” ou um “distribuidor” de dados. Você coloca seus dados (ou objetos que gerenciam dados, como `ChangeNotifier`) em um `Provider` em um ponto altao da árvore de widgets, e qualquer widget abaixo dele pode “solicitar” esses dados.

## Tipos comuns de Providers:

- O pacote `provider` oferece vários tipos de “**`Providers`**”, cada um para um caso de uso específico. Os mais comuns são:
    1. **`Provider<T>`:** O tipo mais básico. Fornece um valor estático (que não muda) para seus descendentes. Útil para valores de configuração que não se alteram ou para instâncias de classes que não precisam notificar mudanças

        ```dart
        import 'package:flutter/material.dart';
        import 'package:provider/provider.dart';
        
        // Classe simples que não notifica mudanças
        class ConfiguracoesApp {
          final String nomeApp = "Meu App Incrível";
          final int versao = 1;
        }
        
        class MyApp extends StatelessWidget {
          @override
          Widget build(BuildContext context) {
            return MaterialApp(
              home: Provider<ConfiguracoesApp>( // Fornecendo ConfiguracoesApp
                create: (context) => ConfiguracoesApp(), // Cria a instância
                child: MinhaTelaInicial(),
              ),
            );
          }
        }
        
        class MinhaTelaInicial extends StatelessWidget {
          @override
          Widget build(BuildContext context) {
            // Acessando o Provider sem ouvir por mudanças (sem listen: true, que é o padrão)
            final config = Provider.of<ConfiguracoesApp>(context);
            return Scaffold(
              appBar: AppBar(title: Text(config.nomeApp)), // Usando o nome do app
              body: Center(
                child: Text('Versão do App: ${config.versao}'),
              ),
            );
          }
        }
        ```

    - **Explicação:** O `Provider<ConfiguraçoesApp>` cria uma única instância de `ConfiguracoesApp` e a disponibiliza para os widgets filhos. `Provider.of<ConfiguracoesApp>(context)` é usado para obter essa instância
    1. **`ChangeNotifierProvider<T>`:** O mais usado e poderoso. Ele é feito para trabalhar com classes que estendem `ChangeNotifier`(como o `ContadorModel` no exemplo de `Consumer`). Quando você chama `notifyListeners()` em seu `ChangeNotifier`, o `ChangeNotifierProvider` avisa à todos os `Consumer` (ou widgets que usam `Provider.of(context, listen: true)` para reconstruir

        ```dart
        import 'package:flutter/material.dart';
        import 'package:provider/provider.dart';
        
        // O mesmo ContadorModel do exemplo do Consumer
        class ContadorModel with ChangeNotifier {
          int _valor = 0;
          int get valor => _valor;
        
          void incrementar() {
            _valor++;
            notifyListeners(); // ESSENCIAL para notificar os Consumers
          }
        }
        
        class MyApp extends StatelessWidget {
          @override
          Widget build(BuildContext context) {
            return MaterialApp(
              home: ChangeNotifierProvider( // Fornecendo o ContadorModel
                create: (context) => ContadorModel(), // Cria a instância
                child: Scaffold(
                  appBar: AppBar(title: Text('Exemplo ChangeNotifierProvider')),
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Consumer<ContadorModel>( // Consume o valor e reconstrói
                          builder: (context, contador, child) {
                            return Text('Valor: ${contador.valor}');
                          },
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Acessa o método sem reconstruir o botão
                            Provider.of<ContadorModel>(context, listen: false).incrementar();
                          },
                          child: Text('Incrementar'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        }
        ```

    - **Explicação:** O `ChangeNotifierProvider` é a ponte entre o seu modelo (`ContadorModel`) e a interface do usuário. Ele “ouve” o `notifyListeners()` e, quando chamado, informa aos `Consumers` para se atualizarem.
    1. **`MultiProvider`:** Quando você tem vários **Providers** que precisam ser disponibilizados, usar um `MultiProvider` é mais limpo do que aninhas vários `Provider`

        ```dart
        import 'package:flutter/material.dart';
        import 'package:provider/provider.dart';
        
        class UsuarioModel with ChangeNotifier {
          String _nome = 'Convidado';
          String get nome => _nome;
          void setNome(String novoNome) {
            _nome = novoNome;
            notifyListeners();
          }
        }
        
        class CarrinhoModel with ChangeNotifier {
          List<String> _itens = [];
          List<String> get itens => _itens;
          void adicionarItem(String item) {
            _itens.add(item);
            notifyListeners();
          }
        }
        
        class MyApp extends StatelessWidget {
          @override
          Widget build(BuildContext context) {
            return MaterialApp(
              home: MultiProvider( // Fornecendo múltiplos Providers
                providers: [
                  ChangeNotifierProvider(create: (context) => ContadorModel()),
                  ChangeNotifierProvider(create: (context) => UsuarioModel()),
                  ChangeNotifierProvider(create: (context) => CarrinhoModel()),
                ],
                child: MeuAppComMultiplosProviders(),
              ),
            );
          }
        }
        
        class MeuAppComMultiplosProviders extends StatelessWidget {
          @override
          Widget build(BuildContext context) {
            // Agora você pode acessar qualquer um deles
            final contador = Provider.of<ContadorModel>(context);
            final usuario = Provider.of<UsuarioModel>(context);
            final carrinho = Provider.of<CarrinhoModel>(context);
        
            return Scaffold(
              appBar: AppBar(title: Text('Olá, ${usuario.nome}')),
              body: Column(
                children: [
                  Text('Contador: ${contador.valor}'),
                  Text('Itens no carrinho: ${carrinho.itens.length}'),
                  ElevatedButton(
                    onPressed: () => usuario.setNome('João da Silva'),
                    child: Text('Mudar Nome'),
                  ),
                ],
              ),
            );
          }
        }
        ```

    - **Explicação:** O `MultiProvider` aceita uma lista de `SingeChildWidget` (que é o que todos os Providers são). Isso torna a árvore de widgets mais organizada e legível

## Quando usar `Provider`(em geral)?

- **Para passar dados para baixo na árvore de widgets:** Evita o “**prop drilling**”
- **Para gerenciar o estado global ou semi-global do aplicativo:** Dados que precisam ser acessados por muitos widgets em diferentes telas (ex: estado de autenticação do usuário, tema do aplicativo, dados do carrinho de compras.
- **Para separar a lógica de negócios da UI:** Mantenha seus dados e alógica que os manipula em classes separadas (`ChangeNotifier`) dos seus `widgets`
- **Para otimização de desempenho:** Ao usar `ChangeNotifierProvider` com `Consumer` (ou `select`), apenas as partes da UI que realmente dependem dos dados mudam são reconstruídas.