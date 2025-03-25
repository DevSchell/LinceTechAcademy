# 📌 Anotações e Comentários

Ao final do uso da ferramenta, pedi para a IA ressaltar minhas perguntas como títulos e as respostas dela como o conteúdo abaixo. Achei interessante as informações passadas por ela e eu também pude localizar tópicos mencionados até agora na **Formação Dart**, bem como inicialização de variáveis, alguns métodos e também explicações sobre **final** e **const**. Algo que achei interessante também foi poder ter um vislumbre de programação orientada à objetos através de alguns dos exemplos gerados pela IA

---

# Atividade - Interação com IA -> Variáveis

## **"Quais as boas práticas em Dart declarando variáveis?"**

Declarar variáveis corretamente no Dart melhora a legibilidade, segurança e eficiência do código. Algumas boas práticas incluem:

### **Usar `var` para inferência de tipo quando possível**
```dart
var nome = "Leonardo"; // Inferido como String
var idade = 22; // Inferido como int
```

### **Usar `final` e `const` para valores imutáveis**
```dart
final dataAtual = DateTime.now(); // Definido em tempo de execução
const PI = 3.1415; // Definido em tempo de compilação
```

### **Nomear variáveis de forma clara e significativa**
```dart
int totalDeAlunos = 30; // Nome descritivo
```

---

## **"O que evitar na hora de declarar variáveis em Dart?"**

### **Evitar usar `dynamic` sem necessidade**
```dart
dynamic valor = "Texto"; // Pode ser qualquer coisa, difícil de manter
```
**Melhor alternativa:**
```dart
String valor = "Texto";
```

### **Não usar nomes genéricos para variáveis**
```dart
var x = 10; // Pouco descritivo
```
**Melhor alternativa:**
```dart
var numeroDePedidos = 10;
```

---

## **"Quais cuidados tomar quando crio variáveis com valor nulo trabalhando com Dart?"**

### **Utilizar `?` para permitir valores nulos**
```dart
String? nome; // Pode ser nulo
```

### **Usar `late` quando souber que a variável será inicializada antes do uso**
```dart
late String mensagem;
mensagem = "Olá, Dart!";
```

---

## **"No Dart, quando usar variáveis nulas e quando usar o modificador `late`?"**

| Caso | Usar `?` | Usar `late` |
|------|---------|------------|
| Quando a variável pode ser nula | ✅ Sim | ❌ Não |
| Quando será inicializada depois da declaração | ❌ Não | ✅ Sim |
| Quando economizar memória for essencial | ❌ Não | ✅ Sim |

Exemplo prático:
```dart
class Usuario {
  late String nome;
  String? apelido;
}
```

---

## **"Quais as diferenças entre `final` e `const` em Dart?"**

| Característica | `final` | `const` |
|--------------|--------|-------|
| Modificável após inicialização? | ❌ Não | ❌ Não |
| Atribuído em tempo de execução? | ✅ Sim | ❌ Não |
| Atribuído apenas em tempo de compilação? | ❌ Não | ✅ Sim |

Exemplo prático:
```dart
final data = DateTime.now(); // Tempo de execução
const PI = 3.1415; // Tempo de compilação
```

---

## **"Por que no Dart usar variáveis `final` e `const` ao invés de usar somente seus valores padrão?"**

Usar `final` e `const` traz vantagens como:
- **Eficiência na execução**
- **Segurança contra reatribuições acidentais**
- **Facilidade na leitura do código**

```dart
const int diasDaSemana = 7; // Claramente imutável
final String usuario = pegarNomeUsuario(); // Definido em tempo de execução
```

---

## **"Quais métodos possuem as variáveis strings no Dart?"**

### **Principais Métodos de Strings**

| Categoria | Métodos |
|-----------|---------|
| **Manipulação** | `toUpperCase()`, `toLowerCase()`, `trim()`, `replaceAll()` |
| **Busca e Verificação** | `contains()`, `indexOf()`, `startsWith()`, `endsWith()` |
| **Extração** | `substring()`, `split()`, `codeUnitAt()` |
| **Conversão** | `toString()`, `int.parse()`, `double.parse()` |
| **Outros** | `repeat()`, `isEmpty`, `isNotEmpty` |

Exemplo:
```dart
String texto = "Dart é incrível!";
print(texto.toUpperCase()); // "DART É INCRÍVEL!"
```

---

## **"Traga a documentação dos métodos de variáveis inteiras."**

A classe `int` no Dart fornece diversos métodos úteis:

| Método | Descrição |
|--------|-----------|
| `abs()` | Retorna o valor absoluto |
| `ceil()` | Arredonda para cima |
| `floor()` | Arredonda para baixo |
| `round()` | Arredonda para o inteiro mais próximo |
| `clamp(a, b)` | Restringe o valor dentro do intervalo [a, b] |

Exemplo:
```dart
int numero = -10;
print(numero.abs()); // 10
```

Para mais detalhes, consulte a [documentação oficial](https://api.flutter.dev/flutter/dart-core/int-class.html).

---

Este documento serve como um guia prático sobre boas práticas ao declarar variáveis em Dart. Além disso, exploramos a manipulação de strings e números inteiros de forma eficiente. Caso precise de mais informações, acesse a documentação oficial do Dart!

---
