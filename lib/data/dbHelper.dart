import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:myapptools/models/todo.dart';

class DbHelper {
  Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb() async {
    String dbPath = join(await getDatabasesPath(), "etrade.db");
    var eTradeDb = await openDatabase(dbPath, version: 1, onCreate: creatDb);
    return eTradeDb;
  }

  void creatDb(Database db, int version) async {
    await db.execute(
        "Create table products(id integer primary key,name text,description text)");
  }

  Future<List<Todo>> getTodo() async {
    Database db = await this.db;
    var result = await db.query("products");
    return List.generate(result.length, (i) {
      return Todo.fromObject(result[i]);
    });
  }

  Future<int> insert(Todo todo) async {
    Database db = await this.db;
    var result = await db.insert("products", todo.toMap());
    return result;
  }

  Future<int> delete(int id) async {
    Database db = await this.db;
    var result = await db.rawDelete("delete from products where id=$id");
    return result;
  }

  Future<int> update(Todo todo) async {
    Database db = await this.db;
    var result = await db.update("products", todo.toMap(),
        where: "id=?", whereArgs: [todo.id]);
    return result;
  }
}
