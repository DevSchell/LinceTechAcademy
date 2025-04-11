# Interação IA - Orientação a Objetos 2

## Chamando método da superclasse para ser usado na subclasse
* Para fazer isso, podemos usar a palavra reservada ``super``
  * Assim, "chamamos" o método da super classe para que ele faça efeito na classe filha
~~~
class Animal {
  void falar() {
    print("Animal faz som");
  }
}

class Cachorro extends Animal {
  @override
  void falar() {
    super.falar(); // chama o método da classe pai
    print("Cachorro late");
  }
}
~~~

# Criando método getter para acessar atributo privado
* Atributos privados podem ser semãnticamente criados com **underline** ( _ ) e o getter é uma função que retorna esse valor
~~~
class Pessoa {
  String _nome = "Leonardo";

  String get nome => _nome; // getter em arrow function
}
~~~

# Quando é melhor usar getters e setters?
* É interessante que usemos métodos getters e setters quando:
  * Queremos controlar o acesso ao valor (ex: formatar, validar e etc)
  * Precisamos de um código que pareça simples, mas que pode mudar internamente depois
  * Queremos proteger o dado (ex: deixar somente leitura do dado)
~~~
class Conta {
  double _saldo = 0;

  double get saldo => _saldo;

  set saldo(double valor) {
    if (valor >= 0) {
      _saldo = valor;
    }
  }
}
~~~

# Quando devo usar classes abstratas em vez de classes concretas?
* Nós usamos classes abstratas quando:
  * Queremos **forçar outras classes a seguir um padrão**
  * A classe não faz sentido ser instanciada diretamente
  * É uma **base com comportamento comum** para outras classes
~~~
abstract class Animal {
  void emitirSom(); // método sem corpo
}
~~~

# Qual a diferença entre composição e herança?
* Para entender melhor, podemos dizer que:
  * ``Herança`` -> "___ é um tipo de ___" -> "**Cachorro**" é um tipo de "**Animal**"
    * Cachorro **extends** Animal
  * ``Composição`` -> "___ tem um ___" -> "Carro" **tem um** "Motor"
    * Usamos um objeto dentro do outro

# O que é uma interface em Dart e como ela define contrato de comportamento?
* Uma interface **define o que uma classe deve ter**, mas **não como ela funciona**
* Em Dart, **qualquer classe abstrata** ou **classe normal** pode ser usada como **interface**
~~~
abstract class Voar {
  void voar();
}

class Passaro implements Voar {
  @override
  void voar() {
    print("Passarinho voando");
  }
}
~~~

# Qual a diferença entre herança e implementação de interface?
* **Herança**(``extends``) -> Você herda o código + comportamento
* **Interface**(``implements``) -> Você só assina o contrato, mas precisa escrever tudo do zero
  * É com se esse "contrato" dissesse que voc~e ao assiná-lo **concorda que a classe tal vai ter tudo que a interface tiver**

# Em quais cenários devo usar métodos estáticos em vez de métodos de instância?
* Use métodos estáticos quando:
  * O **método não depende de nenhum** dado da instãncia
  * É uma **função utilitária**, tipo cálculo ou conversão
~~~
class Matematica {
  static int somar(int a, int b) => a + b;
}
~~~

# Acessando um método estático sem criar instância
* Para fazer isso podemos chamar diretamente pela classe
  * Da mesma forma que fazemos ao usar funções nativas do Dart como
    * ``int.parse();``
    * ``toString();``

# Em quais situações é melhor usar enumeradores ao invés de constantes
* Usamos **enums** quando temos um conjunto fixo de opções que queremos armazenar para usar futuramente
~~~
enum DiaDaSemana { segunda, terca, quarta }

DiaDaSemana hoje = DiaDaSemana.terca;
~~~

# Explicação sobre palavras ``implements`` e ``extends``
* ``extends`` -> herda **código e comportamento** de uma classe
* ``implements`` -> herda **somente a assinatura**, voc~e precisa reimplementar tudo