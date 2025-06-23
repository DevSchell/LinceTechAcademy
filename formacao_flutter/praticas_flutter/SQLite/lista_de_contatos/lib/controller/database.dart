import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:lista_de_contatos/model/pessoa.dart';

Future<Database> getDatabase() async {
  final path = join(await getDatabasesPath(), 'contatos.db');

  return openDatabase(
    path,
    version: 1,
    onCreate: (db, version) {
      print("Criando tabela PESSOA");
      db.execute(TabelaPessoa.createTable);
    },
  );
}

class TabelaPessoa {
  static const String createTable = '''
    CREATE TABLE $tableName(
      $id   INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      $nome TEXT NOT NULL
    );
  ''';

  static const String tableName = 'pessoa';
  static const String id = 'id';
  static const String nome = 'nome';

  static Map<String, dynamic> toMap(Pessoa pessoa) {
    final map = <String, dynamic>{};
    if (pessoa.id != null) {
      map[TabelaPessoa.id] = pessoa.id;
    }
    map[TabelaPessoa.nome] = pessoa.nome;

    return map;
  }
}

class PessoaController {
  // AGORA RETORNA O ID GERADO
  Future<int> insert(Pessoa pessoa) async {
    print("INSERT ESTÁ SENDO ATIVADO");
    final database = await getDatabase();
    final map = TabelaPessoa.toMap(pessoa);

    int id = await database.insert(TabelaPessoa.tableName, map);
    print("INSERIU PESSOA COM ID: $id");
    return id;
  }

  Future<List<Pessoa>> select() async {
    final database = await getDatabase();

    final List<Map<String, dynamic>> result = await database.query(
      TabelaPessoa.tableName,
    );

    var list = <Pessoa>[];

    for (final item in result) {
      list.add(Pessoa(
        id: item[TabelaPessoa.id] ?? 0,
        nome: item[TabelaPessoa.nome] ?? "NULL",
      ));
    }

    return list;
  }
}
