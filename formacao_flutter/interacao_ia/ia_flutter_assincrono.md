## Quais cuidados devo ter usando programação assíncrona?
* **Programação assíncrona** permite que você execute tarefas demoradas (como requisições HTTP) sem travar a interface do app
* **Cuidados importantes**
  * **Não bloquear a UI:** Evite o ``.then()`` sem ``await``, pois pode deixar o código confuso
  * **Evite múltiplos awaits em sequência:** Tente usar ``Future.wait()`` quando possível
  * **Lide com erros:** Sempre use ``try-catch`` ao usar ``await``, pois exceções podem ser lançadas
  * ``Cancelamento:`` Para tarefas longas (como streams ou downloads), é legal implementar cancelamento quando necessário

## O que são Isolates?
* São com "mini-programas" rodando em paralelo dentro do seu app
  * Eles são usados para **executar tarefas pesadas sem travar a interface (UI)**

### Comparação simples:
No Flutter, tudo roda em uma **única thread principal**, inclusive a interface. Se você fizer algo muito pesado, **a interface vai travar**. 
Isolate é uma forma de rodar essa tarefa em outro "processo separado"

#### Exemplo prático
* Vamos supor que você quer calcular a sequência de Fibonacci de forma pesada:
~~~
int fibonacci(int n) {
  if (n <= 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}
~~~
* Se rodar isso direto na ``main``, a UI congela
* Agora com ``Isolate``:
~~~
import 'dart:isolate';

void calcularFibonacci(SendPort sendPort) {
  int resultado = fibonacci(40);
  sendPort.send(resultado);
}

void iniciarIsolate() async {
  ReceivePort receivePort = ReceivePort();

  await Isolate.spawn(calcularFibonacci, receivePort.sendPort);

  receivePort.listen((mensagem) {
    print('Resultado recebido do isolate: $mensagem');
  });
}
~~~

### Quando usar Isolates
* Use ``Isolate`` quando:
  * For fazer **processamento de imagem, som, PDF**
  * Precisar **processar muito texto ou dados localmente**
  * Usar algum **plugin nativo** que bloqueia a thread principal

### Quais cuidados devo ter ao usar isolates em Flutter?
* ``Isolates`` são "threads" separadas no Dart para tarefas pesadas (ex: cálculos intensos, leitura de arquivos grandes)
* Cuidados:
  * **Sem compartilhamento de memória:** Use ``ReceibePort`` e ``SendPort`` para trocar mensagens
  * **Evite usar para tudo:** Só use isolates quando tarefas forem realmente pesadas
  * **Não use widgets em isolates:** isolates não têm acesso á UI
  
## Como posso lidar com erros em operações assíoncronas usando ``try-catch``?
~~~
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.exemplo.com'));
    if (response.statusCode == 200) {
      print('Sucesso!');
    } else {
      print('Erro na requisição: ${response.statusCode}');
    }
  } catch (e) {
    print('Erro ao buscar dados: $e');
  }
}
~~~
* Use sempre ``try-catch`` com ``await`` para evitar que erros parem a execução do app

## Explicação dos métodos HTTP
* **GET:** Buscar dados (mais usado)
* **POST:** Enviar dados (criar)
* **PUT:** Atualizar dados (tudo)
* **PATCH:** Atualizar parcialmente
* **DELETE:** Remover

## Como lidar com diferentes códigos de resposta HTTP?
~~~
if (response.statusCode == 200) {
  print('OK');
} else if (response.statusCode == 404) {
  print('Recurso não encontrado');
} else if (response.statusCode == 500) {
  print('Erro interno do servidor');
} else {
  print('Erro desconhecido: ${response.statusCode}');
}
~~~
* Sempre trate os erros mais comuns (404, 500) e tenha um **fallback** genérico
  * **fallback** é o termo usado apra se referir à o que o aplicativo faz "**caso dê algo errado**"

## Dificuldade em mapear JSON para classe
* Imagine esse JSON
~~~
{
  "nome": "Leo",
  "idade": 22
}

~~~
* Crie uma classe Dart:
~~~
class Pessoa {
  final String nome;
  final int idade;

  Pessoa({required this.nome, required this.idade});

  factory Pessoa.fromJson(Map<String, dynamic> json) { //factory p criar
    return Pessoa(
      nome: json['nome'],
      idade: json['idade'],
    );
  }

  Map<String, dynamic> toJson() { //Método que transforma info em arquivo JSON
    return {
      'nome': nome,
      'idade': idade,
    };
  }
}

~~~

## Como organizar requisições no código Flutter?
* Boa prática: separa tudo numa camada de ``services``
* Exemplo
~~~
// services/pessoa_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/pessoa.dart';

class PessoaService {
  Future<Pessoa> fetchPessoa() async {
    final response = await http.get(Uri.parse('https://api.exemplo.com/pessoa'));

    if (response.statusCode == 200) {
      return Pessoa.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Erro ao carregar pessoa');
    }
  }
}
~~~