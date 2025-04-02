# Estruturas Condicionais e Laços de Repetição em Dart
Abaixo estão as anotações que fiz baseada na interação que tive com a IA me explicando <br>
sobre os temos abordados desde a última interação com a IA

## 1. Diferença entre `if`, `else if` e `else`
- **`if`**: Usado para testar uma condição principal.
- **`else if`**: Usado para testar condições alternativas caso o `if` não seja verdadeiro.
- **`else`**: Executado quando nenhuma das condições anteriores for verdadeira.

### Exemplo (Semáforo)
```dart
String sinal = "vermelho";

if (sinal == "verde") {
  print("Pode seguir!");
} else if (sinal == "amarelo") {
  print("Desacelere!");
} else {
  print("Pare!");
}
```

## 2. Cuidados ao usar `if` e `else`
- **Ordem das condições**: Coloque as mais específicas primeiro.
- **Evitar ifs desnecessários**: Se um `else` já cobre os outros casos, não precisa de um `else if`.
- **Comparação correta**: Certifique-se de comparar valores do mesmo tipo.

### Exemplo Errado
```dart
if (idade >= 18) {
  print("Maior de idade");
} else if (idade < 18) {
  print("Menor de idade");
}
```

### Exemplo Correto
```dart
if (idade >= 18) {
  print("Maior de idade");
} else {
  print("Menor de idade");
}
```

## 3. Quando usar `switch` em vez de `if else`?
- **Quando há muitas comparações com um mesmo valor**.
- **Torna o código mais organizado e legível**.
- **Mais eficiente que múltiplos `if else` em algumas situações**.

### Exemplo (Dia da Semana)
```dart
String dia = "segunda";

switch (dia) {
  case "segunda":
    print("Começo da semana!");
    break;
  case "sexta":
    print("Sextou!");
    break;
  case "domingo":
    print("Dia de descanso!");
    break;
  default:
    print("Dia comum.");
}
```

## 4. Diferença entre `for` tradicional e `for...in`
- **`for` tradicional**: Usado quando você precisa de um contador.
- **`for...in`**: Usado quando deseja percorrer diretamente os elementos de uma lista.

### Exemplo (`for` tradicional - contar de 1 a 5)
```dart
for (int i = 1; i <= 5; i++) {
  print(i);
}
```

### Exemplo (`for...in` - percorrer uma lista de frutas)
```dart
List<String> frutas = ["Maçã", "Banana", "Uva"];

for (String fruta in frutas) {
  print(fruta);
}
```

## 5. Como repetir um bloco de código um número específico de vezes?
- **Usando um loop `for` com contador**.

### Exemplo (Imprimir "Oi" 3 vezes)
```dart
for (int i = 0; i < 3; i++) {
  print("Oi");
}
```

## 6. Diferença entre `break` e `continue`
- **`break`**: Interrompe o loop imediatamente.
- **`continue`**: Pula para a próxima iteração, sem executar o restante do código.

### Exemplo (`break` para parar quando encontrar um número específico)
```dart
for (int i = 1; i <= 5; i++) {
  if (i == 3) {
    break;
  }
  print(i);
}
// Saída: 1, 2
```

### Exemplo (`continue` para pular um número específico)
```dart
for (int i = 1; i <= 5; i++) {
  if (i == 3) {
    continue;
  }
  print(i);
}
// Saída: 1, 2, 4, 5
```

## 7. Como usar `break` para sair de um loop aninhado?
- **Usando um rótulo (`label`) para quebrar um loop externo**.

### Exemplo sem label (quebrando apenas o loop interno)
```dart
for (int i = 0; i < 3; i++) {
  for (int j = 0; j < 3; j++) {
    if (i == 1 && j == 1) {
      break; // Sai apenas do loop interno
    }
    print("i: $i, j: $j");
  }
}
print("Fim");
```

### Exemplo com label (saindo de ambos os loops)
```dart
outerLoop:
for (int i = 0; i < 3; i++) {
  for (int j = 0; j < 3; j++) {
    if (i == 1 && j == 1) {
      break outerLoop; // Sai dos dois loops
    }
    print("i: $i, j: $j");
  }
}
print("Fim");
```

## 8. Quando usar `continue` em um loop?
- **Quando você quer ignorar certos valores e continuar o loop sem interrompê-lo**.

### Exemplo (Imprimir apenas números pares de 1 a 10)
```dart
for (int i = 1; i <= 10; i++) {
  if (i % 2 != 0) {
    continue;
  }
  print(i);
}
// Saída: 2, 4, 6, 8, 10
```
