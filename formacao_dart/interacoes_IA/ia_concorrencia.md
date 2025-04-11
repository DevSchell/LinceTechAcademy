# Interação IA - Concorrência

## O que acontece se um ``Future`` falhar e como posso lidar com esse erro?
* Quando um Future falha, ele entra no estado de erro
  * Nós podemos lidar com isso usando ``try/catch`` ou o método ``.catchError()``.
### Exemplo com ``try/catch``
~~~
Future<void> fetchData() async {
  try {
    final data = await Future.error('Algo deu errado');
    print(data);
  } catch (e) {
    print('Erro capturado: $e');
  }
}
~~~
### Exemplo com ``.catchError()``
~~~
Future<void> fetchData() {
  return Future.error('Erro inesperado')
      .catchError((e) => print('Capturado com catchError: $e'));
}
~~~

## Existe uma forma de executar várias tarefas assíncronas em paralelo?
* Sim! Nós podemos usar o ``Future.wait`` para aguardar várias tarefas assíncronas ao mesmo tempo
~~~
Future<String> tarefa1() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Tarefa 1 completa';
}

Future<String> tarefa2() async {
  await Future.delayed(Duration(seconds: 1));
  return 'Tarefa 2 completa';
}

void executarParalelo() async {
  final resultados = await Future.wait([tarefa1(), tarefa2()]);
  print(resultados); // ['Tarefa 1 completa', 'Tarefa 2 completa']
}
~~~

## Em quais situações devo usar ``Future`` em meu código Dart?
* Usamos Future quando:
  * A **tarefa demora pode demorar** (ex: leitura de arquivos, requisições HTTP, delays)
  * Você quer **simular comportamentos assíncronos** (ex: uma API falsa)
  * Está **lidando com qualquer operação que não deve travar a execução principal** (ex: Aplicativos em Flutter, pois com o travamento a UI pode travar também)

## Quais cuidados devo tomar não usando await em funções ``Future``?
* Se não usarmos await, o Dart não vai esperar a conclusão da função. Isso pode causar:
  * **Execução fora de ordem**
  * Erros **não tratados**
  * Tarefas que **nunca terminam** (Se esquecermos de lidar com o retorno)
### Exemplo
~~~
Future<void> imprimirDepois() async {
  await Future.delayed(Duration(seconds: 1));
  print('Depois de 1 segundo');
}

void main() {
  imprimirDepois(); // Executa mas o programa não espera
  print('Imediato'); // Esse print pode sair antes
}
~~~
### Correção ideal
~~~
Future<void> imprimirDepois() async {
  await Future.delayed(Duration(seconds: 1));
  print('Depois de 1 segundo');
}

void main() async {
  await imprimirDepois(); 
  print('Agora depois'); 
}
~~~

## O que são Threads na linguagem Dart?
* Dart usa **isolates** em vez de threads tradicionais. Um isolate é como uma thread, mas com sua própria memória isolada. Eles **não compartilham estado**, então se **comunicam por mensagens**
* Na prática, se você quiser paralelismo pesado (ex: cálculos complexos), pode usar Isolates. Mas para tarefas normais, ``Futures`` + ``async/await`` resolve bem
### Exemplo comparativo
* Imagine que o computador é uma **cozinha** e nós queremos preparar uma **refeição**
  * ``Thread`` é **como** um cozinheiro cozinha
  * Cada ``thread`` executa **uma sequência de instruções**(tarefas)
* Por padrão, os programa rodam em uma única thread (Um cozinheiro fazendo tudo de forma sequencial, uma coisa de cada vez.)
  * Mas, às vezes queremos fazer várias coisas ao mesmo tempo, tipo cozinhar um arroz e fritar um ovo.
    * Aí entram as **múltiplas threads** (vários cozinheiros trabalhando juntos).

## Problemas com threads normais
* Threads podem **compartilhar a mesma memória**, o que gera problemas como:
  * **Concorrência**: duas threads tentando alterar a mesma variável ao mesmo tempo
  * **Erros difíceis de encontrar** (ex: acessar um dado que a outra thread ainda não terminou de mudar)

## Isolates - O que são?
* Em Dart é um pouco diferente das outras linguagens, ele **não usa threads com memória compartilhada**. Ele usa uma abordagem chamada **Isolate**
  * Um **Isolate** é como um cozinheiro com sua **própria cozinha**

* Cada isolate tem sua **própria memória**
* Não há risco de duas "cozinhas" mexerem nos mesmos ingredientes
* Eles se comunicam **enviando mensagens** entre si(como se gritassem de uma cozinha para outra: "O arroz tá pronto!")

## Como posso simular um erro em um Future usando ``Future.error``?
* Basta chamar o ``Future.error`` mesmo
~~~
Future<String> simularErro() {
  return Future.error('Erro simulado');
}

void main() async {
  try {
    await simularErro();
  } catch (e) {
    print('Erro capturado: $e');
  }
}
~~~

## Como posso criar uma função que retorna um Future que simula uma demora do programa?
* Usamos ``Future.delayed``
~~~
Future<String> simularDemora() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Demora de 2 segundos concluída';
}
~~~
* Ou uma versão mais direta
~~~
Future<String> simularDemora() {
  return Future.delayed(Duration(seconds: 2), () => 'Concluído');
}
~~~