import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'sipsmart.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE drink_logs (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        association_id TEXT,
        member_id TEXT,
        drink_count INTEGER,
        timestamp TEXT,
        synced INTEGER DEFAULT 0
      )
    ''');
  }

  Future<int> insertDrinkLog(Map<String, dynamic> log) async {
    Database db = await database;
    return await db.insert('drink_logs', log);
  }

  Future<List<Map<String, dynamic>>> getUnsyncedLogs() async {
    Database db = await database;
    return await db.query('drink_logs', where: 'synced = 0');
  }

  Future<int> markLogAsSynced(int id) async {
    Database db = await database;
    return await db.update('drink_logs', {'synced': 1},
        where: 'id = ?', whereArgs: [id]);
  }
}
