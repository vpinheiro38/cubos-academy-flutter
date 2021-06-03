import 'package:aula16/internal_storage.dart';
import 'package:aula16/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLAdapter extends InternalStorage {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();
    return _database!;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), 'user_database.db');

    return await openDatabase(path, onCreate: (db, version) {
      return db.execute("CREATE TABLE Users(name TEXT, surname TEXT)");
    }, version: 1);
  }

  @override
  Future<String> getFullName() async {
    final Database db = await database;
    var response =
        await db.query('Users', columns: ['rowid', 'name', 'surname']);

    if (response.isNotEmpty) {
      final user = User.fromMap(response.last);
      return '${user.rowid} ' + user.name + ' ' + user.surname;
    } else {
      return Future.value('Usuário não encontrado!');
    }
  }

  @override
  void saveUser(String name, String surname) async {
    final Database db = await database;
    var user = {'name': name, 'surname': surname};
    await db.insert('Users', user);
    print("Usuário no Banco de Dados");
  }

  @override
  void deleteUser(int userID) async {
    final Database db = await database;
    await db.delete('Users', where: 'rowid = ?', whereArgs: [userID]);
    print("Usuário ${userID} deletado");
  }
}
