# Interação IA - Tratamento de Exceções

## **Erro vs Exceção**
* Erros são problemas que realmente estão fora do nosso controle como desenvolvedores
  * Ex: erros na máquina do usuário, uma API que não está em serviço e etc...
* Exceções são problemas “mais controláveis”. Aquelas situações que conseguikmos prever que pode acontecer durante a execução de um determinado código. Esses nós conseguimos tratar
~~~
try {
  int resultado = 10 ~/ 0; // Divisão por zero causa uma IntegerDivisionByZeroException
  print(resultado);
} catch (e) {
  print('Ops, deu ruim na divisão: $e');
}
~~~

## Capturando diferentes ``exceptions`` com ``try/catch``
* Conseguimos ter vários catches pra lidar com tipos específicos de exceções. Isso te dá mais controle sobre como reagir a cada situação
~~~
try {
  dynamic valor = 'abc';
  int numero = int.parse(valor); // Pode lançar FormatException
  List<int> lista = [1, 2];
  print(lista[5]); // Pode lançar RangeError
} on FormatException catch (e) {
  print('Deu erro ao converter para número: $e');
} on RangeError catch (e) {
  print('Índice fora da lista: $e');
} catch (e) {
  print('Outro erro aconteceu: $e'); // Catch genérico para outros tipos
}
~~~

## Utilidade do ``finally``
* O finally é ótimo pra garantir que algo no código vai acontecer, porque dentro de um try/catch, sempre o que estiver dentro do bloco de finally **vai acontecer independentemente se o bloco de código do try der erro ou não**.

## Por que lançar uma exceção?
* Às vezes, uma função ou método encontra uma situação inesperada que ela não consegue resolver sozinha. Lançar uma exceção é uma forma de sinalizar para o código que chamou essa função que algo deu errado e que ele precisa lidar com isso. É uma forma elegante de comunicar falhas
~~~
String pegarNome(Map<String, String> pessoa, String chave) {
  if (!pessoa.containsKey(chave)) {
    throw StateError('A chave "$chave" não existe no mapa de pessoa.');
  }
  return pessoa[chave]!;
}

void main() {
  Map<String, String> usuario = {'nome': 'João'};
  try {
    String nome = pegarNome(usuario, 'idade');
    print('Nome: $nome');
  } catch (e) {
    print('Ocorreu um erro: $e');
  }
}
~~~

## Personalizando mensagens de erro
* Ao lançar uma exceção, você pode passar uma mensagem descritiva para dar mais contexto sobre o que aconteceu
~~~
void sacar(double saldo, double valorSaque) {
  if (valorSaque > saldo) {
    throw ArgumentError('Saldo insuficiente. Você tem $saldo, tentou sacar $valorSaque.');
  }
  print('Saque realizado com sucesso!');
}

void main() {
  try {
    sacar(100.0, 150.0);
  } catch (e) {
    print('Erro ao sacar: $e');
  }
}
~~~

## Melhores práticas para lançar exceções
* Lance exceções específicas que descrevam bem o probelema
  * Use exceções built-in do Dart sempre que possível
* Inclua mensagens de erro claras e infromativas
* Documento as exceções que sua função pode lançar
* Evite usar exceções para fluxo de controle normal do seu programa. Elas devem indicar situações excepcionais.

## ``Assert`` vs ``Exception``
* **Assert** é  uma ferramenta para desenvolvimento e testes. Você usa para verificar condições que devem ser verdade em um determinado ponto do seu código. Se a condição for falsa, o programa para. **Não é para tratamento de erros em produção.**
* Já lançar uma **Exception**  é para lidar com situações inesperadas que podem acontecer com usuários rodando o software

## Quando ``assert`` é mais útil?
* Verificar pré-condições de uma função (argumentos válidos)
* Verificar pós-condições de uma função( se o resultado estáa como esperado)
* Verificar invariantes de calsse (propriedades que devem semrpe ser verdade)
* Durante testes unitários para garantir que o código se comporta como esperado

## ``Print`` de erro vs ``throw Exception``
* Usar ``print`` para mostrar um erro é como “sussurrar” para você mesmo. O programa continua rodando, e ninguém mais “sabe” que algo deu errado de verdade.
* ``throw Exception`` é um sinal alto e claro de que algo deu muito errado. Ele interrompe o fluxo normal do programa(a menos que seja capturado com try/catch ) e permite que outras partes do código reajam a essa falha de forma estruturada
~~~
void tentarAlgo(int valor) {
  if (valor < 0) {
    print('Erro: Valor negativo não permitido.'); // Apenas uma mensagem
    return; // O programa continua
  }
  print('Processando valor: $valor');
}

void tentarAlgoComExcecao(int valor) {
  if (valor < 0) {
    throw ArgumentError('Valor negativo não permitido.'); // Interrompe (se não capturado)
  }
  print('Processando valor: $valor');
}

void main() {
  tentarAlgo(-5);
  print('Programa continua...'); // Isso será impresso

  try {
    tentarAlgoComExcecao(-5);
    print('Isso não será impresso se a exceção não for tratada aqui.');
  } catch (e) {
    print('Erro capturado: $e'); // A exceção é tratada aqui
  }
  print('Programa continua após o tratamento da exceção.');
}
~~~