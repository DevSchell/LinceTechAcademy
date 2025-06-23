import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:lista_de_contatos/model/pessoa.dart';

Future<Database> getDatabase() async {
  final path = join(await getDatabasesPath(), 'contatos.db');

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(TabelaPessoa.createTable);
      version:
      1;
    },
  );
}

class TabelaPessoa {
  static const String createTable =
      '''
    CREATE TABLE $tableName(
      $id   INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      $nome TEXT NOT NULL
    );
  ''';

  // Nome da tabela
  static const String tableName = 'pessoa';

  // Colunas da tabela
  static const String id = 'id';
  static const String nome = 'nome';

  static Map<String, dynamic> toMap(Pessoa pessoa) {
    final map = <String, dynamic> {};

    map[TabelaPessoa.id] = pessoa.id;
    map[TabelaPessoa.nome] = pessoa.nome;

    return map;
  }
}

class PessoaController {
  Future<void> insert(Pessoa pessoa) async {
    final database = await getDatabase(); //Aqui eu to fazendo conexão com o banco de dados
    final map = TabelaPessoa.toMap(pessoa);

    await database.insert(TabelaPessoa.tableName, map);

    return;
  }
}
