import 'package:pintura/app/shared/utils/constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Dados {
  static final String _nomeDB = "pinturakids.db";
  static final int _versaoDB = 1;

  static final Dados _instance = Dados.internal();
  factory Dados() => _instance;

  Dados.internal();

  Database? _dataBase;

  Future<Database> get dataBase async {
    try {
      if (_dataBase != null) {
        return _dataBase!;
      } else {
        _dataBase = await _initDatabase();
        return _dataBase!;
      }
    } catch (e) {
      throw (e);
    }
  }

  // Abre a base de dados (e cria quando ainda não existir).
  Future<Database> _initDatabase() async {
    String caminhoDoBanco = await getDatabasesPath();
    String _banco = _nomeDB;
    String path = join(caminhoDoBanco, _banco);

    return await openDatabase(
      path,
      version: _versaoDB,
      onCreate: _criarBanco,
      onUpgrade: _atualizarBanco,
    );
  }

  void _atualizarBanco(Database banco, int antigaVersao, int novaVersao) async {
    var query = [];

    query.add(""); //i=0 <-- Aqui não coloca nada -->

    for (int i = antigaVersao; i < novaVersao; i++) {
      print(query[i]);
      await banco.execute(query[i]);
    }
  }

  Future<void> _criarBanco(Database banco, int novaVersao) async {
    List<String> queryes = [
      "CREATE TABLE $tableFoto ($fotoId INTEGER PRIMARY KEY, $fotoData TEXT, $fotoCaminho TEXT);",
    ];

    for (String query in queryes) {
      await banco.execute(query);
    }
  }
}
