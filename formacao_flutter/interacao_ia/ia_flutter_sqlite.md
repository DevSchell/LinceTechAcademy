## 1. Como posso inserir novos registros em uma tabela SQLite usando Flutter?
* Para inserir registros em uma tabela SQLite no Flutter, normalmente utiliza-se o pacote ``sqflite``.
* O método principal é o ``insert``, que recebe o nome da tabela e um mapa com os dados à serem inseridos
~~~
int id = await db.insert(
  'my_table',
  {'name': 'Bob'},
);
~~~
* Esse método retorna o ID do registro inserido

## 2. Como posso inserir vários registros de uma vez em uma tabela SQLite?
* O método ``INSERT`` insere um registro por vez. Para inserir vários registros, você precisa usar um loop para chamar ``INSERT`` para cada item, preferencialmente dentro de uma transação para garantir atomicidade e melhor performance
~~~
await db.transaction((txn) async {
  for (var item in listaDeItens) {
    await txn.insert('my_table', item.toMap());
  }
});
~~~
* Assim, todos os ``INSERT`` são feitos de forma segura e eficiente dentro de uma transação

## 3. Como posso obter o ID do último registro inserido em uma tabela SQLite?
* O método ``INSERT`` do ``sqflite`` já retorna o ID do registro inserido:
~~~
int id = await db.insert('my_table', {'name': 'Bob'});
print('ID inserido: $id');
~~~

## 4. Como posso filtrar os resultados de uma consulta usando a cláusula ``where``?
* Use o método ``query`` com os parâmetros ``where`` e ``whereARgs``:
~~~
List<Map<String, dynamic>> results = await db.query(
  'my_table',
  where: 'name = ?',
  whereArgs: ['Bob'],
);
~~~
* O ``?`` é substituído pelo valor em ``whereArgs``, prevenindo **SQL Injection**

## 5. Como posso agrupar os resultados de uma consulta usando ``GROUP BY``?
* No método ``query``, use o parâmetro ``groupBy``:
~~~
List<Map<String, dynamic>> results = await db.query(
  'my_table',
  columns: ['category', 'COUNT(*)'],
  groupBy: 'category',
);
~~~
* Isso retorna os dados agrupados pela coluna especificada

## 6. Como posso excluir registros de uma tabela SQLite usando Flutter?
* Utilize o método ``delete``:
~~~
await db.delete(
  'my_table',
  where: 'id = ?',
  whereArgs: [id],
);
~~~
* Isso remove o registro com o ID informado

## 7. Quais os cuidados necessárioas ao usar ``UPDATE``, ``INSERT`` e ``DELETE``?
* Sempre utilize ``where`` e ``whereArgs`` para evitar deletar/alterar todos os registros por engano
* use transações (``transaction``) para garantir que múltiplas operações sejam atômicas
* Trate exceções com ``try/catch`` para capturar erros de disco ou de sintaxe SQL
* Valide os dados antes de inserir ou atualizar para evitar inconsistência

## 8. Como posso criar tabelas relacionadas em um banco de dados SQL?
* Use ``FOREIGN KEY`` ao criar as tabelas. Exemplo:
~~~
CREATE TABLE Cargos(
  CargoId INTEGER PRIMARY KEY,
  CargoNm TEXT
);

CREATE TABLE Func(
  FuncId INTEGER PRIMARY KEY,
  CargoId INTEGER,
  FuncNm TEXT,
  FOREIGN KEY (CargoId) REFERENCES Cargos(CargoId)
);
~~~
* Assim, a tabela ``Func`` referencia a tabela ``Cargos``

## 9. Como posso consultar dados de tabelas relacionadas usando ``JOIN``?
* Utilize a cláusula ``JOIN`` em sua consulta SQL:
~~~
SELECT f.FuncNm, c.CargoNm
FROM Func f
JOIN Cargos c ON c.CargoId = f.CargoId
~~~
* No Flutter, use o método ``rawQuery`` para executar SQLs complexos:
~~~
List<Map<String, dynamic>> results = await db.rawQuery('''
  SELECT f.FuncNm, c.CargoNm
  FROM Func f
  JOIN Cargos c ON c.CargoId = f.CargoId
''');
~~~

## 10. Como posso criar um banco de dados e uma tabela em SQLite usando Flutter?
* Use o método ``openDatabase`` e forneça a função ``onCreate:`` para criar as tabelas
~~~
Future<Database> _getDatabase() async {
  return openDatabase(
    join(await getDatabasesPath(), 'meu_banco.db'),
    onCreate: (db, version) {
      return db.execute('''
        CREATE TABLE my_table(
          id INTEGER PRIMARY KEY,
          name TEXT
        )
      ''');
    },
    version: 1,
  );
}
~~~

## Quais são boas sugestões para otimizar minhas consultas ao banco de dados?
* Crie índices em colunas frequentemente usadas em buscas
* Use apenas as colunas necessárias no ``SELECT``
* Prefira transações para múltiplas operações
* Evite consultas complexas desnecessárias
* Use parâmetros (``whereArgs``) para evitar SQL Injection e melhorar performance do cache de consultas

## 12. ``FOREIGN KEY``, ``PRIMARY KEY`` e Tabelas Relacionais

### ``PRIMARY KEY``
* É um campo em uma tabela ou grupo de tabelas, que identifica de forma única cada registro dessa tabela. Não pode haver dois registros com o mesmo valor de chave primária, e ela nunca pode ser nula.
 Por exemplo, em uma tabela ``Usuarios``, o campo ``ID`` costuma ser a chave primária, garantindo que cada usuário tenha um identificador único.

### ``FOREIGN KEY``
* É um campo em uma tabela ou grupo de tabelas, que faz referência à chave primária de outra tabela. Ela serve para criar uma ligação entre as tabelas, permitindo relacionar informações de diferentes tabelas de forma consistente e organizada.
 Por exemplo, se você tem uma tabela ``Pedidos`` e uma tabela ``Usuarios``, pode criar um campo ``UsuarioID`` em ``Pedido`` que seja uma chave estrangeira apontando para o ``ID`` da tabela ``Usuarios``.
 Isso garante que cada pedido esteja associado à um usuário existente

### Tabelas Relacionadas
* Quando você utiliza chaves estrangeiras, você está relacionando tabelas. Existem três principais tipos de relacionamento
  * **Um-para-um (1:1):** Um registro de uma tabela pode estar relacionado à um único registro de outra
  * **Um-para-muitos (1:N):** Um registro de uma tabela pode estar relacionado à vários registros de outra (exemplo: um usuário pode ter vários pedidos)
  * **Muitos-para-Muitos (N:N):** Vários registros de uma tabela podem se relacionar com vários registros de outra, normalmente usando uma tabela intermediária
  * ~~~
    CREATE TABLE Usuarios (
    ID INTEGER PRIMARY KEY,
    Nome TEXT
    );

    CREATE TABLE Pedidos (
    ID INTEGER PRIMARY KEY,
    DataPedido DATE,
    UsuarioID INTEGER,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(ID)
    );
    ~~~
    * Neste exemplo, ``UsuarioID`` em ``Pedidos`` é uma **foreign key** que referencia o campo ``ID`` da tabela ``Usuarios``, garantindo a integridade dos dados e a relação entre as tabelas