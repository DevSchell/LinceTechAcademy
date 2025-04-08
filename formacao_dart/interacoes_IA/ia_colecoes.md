# Prompt
    "Contexto: Estou aprendendo sobre listas, conjuntos e mapas em Dart e gostaria de saber sobre alguns tópicos. Eu gostaria que em todos eles, você também me trouxesse explicações didáticas, exemplos de como usar e sempre trazendo pro dia a dia de uma pessoa que ainda não vive da programação mas que está estudando pra chegar lá.

    1. Quais as boas práticas no uso de listas em dart? 
    2. Que práticas posso adotar para trazer uma melhor performance ao usar listas em dart?
    3. O que não é recomendado fazer quando usado listas em dart?
    4. Como entender quando usar listas e quando usar mapas? 
    5. Em dart quais práticas são interessantes no uso de mapas. 
    6. Quais métodos podem me auxiliar no uso de listas e sets em dart?
    7. Quais cuidados devo levar ao usar sets?
    8. Traga a documentação do método elementaAtOrNull. 
    9. Como iterar de formas eficients em listas
    10. Explique-me o método spread operator

    Lembre de explicar de uma forma clara e didática, com uma linguagem também clara"

# Anotaçõess e comentários - Notion

# Boas práticas no uso de Dart

- **Inicialização adequada** → Sempre que possível, inicializa a lista com o tamanho adequado ou com os dados que você realmente precisa.
- **Evite listas muito grandes em memória** → Se você estiver lidando com grandes volumes de dados, considere usar outras estruturas, como **streams**.
- **Evite modificar listas durante iteração** → Modificar uma lista enquanto a percorre pode gerar comportamentos inesperados.
- **Preferir o uso de *const* quando possível** → Se a lista não vai ser alterada após sua criação, prefira usar ***const*** para melhorar o desempenho.

# Práticas para melhor performance para listas em Dart

- **Evitar listas grandes quando possível** → Se a sua aplicação não precisa de grandes volumes de dados de uma vez, divida a carga.
- **Usar listas fixas (const)** → Usar listas fixas quando você tem um conjunto de elementos que não vai mudar. Isso pode reduzir o uso de memória e melhorar a performance.
- **Usar o `List.filled` ou `List.generate`** quando souber o tamanho da lista antecipadamente, ao invés de usar um `add()` repetidamente.
- **Evitar inserções e remoções frequentes no meio da lista** → Operações de inserção/remoção no meio de uma lista são caras em termos de desempenho, pois exigem que o restante dos elementos sejam movidos.

# Quando usar listas e quando usar mapas?

- **Listas** **→** São usadas quando a **ordem importa** e você precisa **armazenar múltiplos** itens de forma sequencial (ex: uma lista de números, nomes ou produtos).
- **Mapas** **→** São usados quando você **tem pares chave-valor** e precisa **acessar um item rapidamente** com base em uma **chave única** que funciona como ID. (ex: um dicionário de palavras e seus significados).

# Boas práticas para manusear mapas em Dart

- **Evitar inserir elementos repetidos** com a mesma chave.
    - Um mapa não permite chaves duplicadas. Se você tentar, o valor será sobrescrito.
- Use o **método `containsKey`** para **verificar se a chave já existe**.
    - Isso evita exceções ao acessar chaves inexistentes.
- Evite criar mapas com muitas **entradas repetidas**.
    - Isso pode afetar o desempenho de busca.

# Métodos para listas em Dart

- `add()`: Adiciona um item.
- `remove()`: Remove um item.
- `length`: Retorna o tamanho da lista.
- `contains()`: Verifica se a lista contém um elemento.
- `sublist()`: Cria uma sublista a partir de um intervalo.
- `clear()`: Remove todos os elementos.

# Métodos para Sets em Dart

- `add()`: Adiciona um item, mas se o item já existir, ele não será adicionado novamente.
- `remove()`: Remove um item.
- `contains()`: Verifica se o item está presente no set.
- `intersection()`: Retorna a interseção entre dois sets.

# Cuidados para se ter ao trabalhar com Sets em Dart

- **Sets não permitem duplicatas**:
    - Isso é bom para garantir que não haverá itens repetidos, mas também significa que você não pode adicionar o mesmo item várias vezes.
- **Ordem não garantida**:
    - Sets não mantêm a ordem dos elementos, então se a ordem for importante para o seu caso, prefira listas.
- **Verificar se o item existe antes de adicionar**:
    - Essa prática pode ser útil para evitar verificações repetidas.

# Documentação do método `elementAtOrNull`

- O método `elementAtOrNull` é utilizado para obter um elemento de uma lista ou de uma coleção que tenha um índice específico, mas sem lançar uma exceção caso o índice seja inválido (fora do intervalo da lista).
    - Este método é muito útil para evitar erros quando tentamos acessar um índice que não existe na lista, retornando `null` em vez de uma exceção.

# Formas eficientes de iterar em listas

- **For Loop**: A forma mais clássica de iterar.

```dart
List<int> lista = [1, 2, 3];
for (var i = 0; i < lista.length; i++) {
  print(lista[i]);
}
