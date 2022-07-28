import 'package:crud_sqlite_flutter/db_helper/database_connexion.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  late DatabaseConnection _databaseConnection;
  Repository() {
    _databaseConnection = DatabaseConnection();
  }
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _databaseConnection.setDatabase();
      return _database;
    }
  }

  // Insertion
  insertData(table, data) async {
    var connection = await database;
    return await connection?.insert(table, data);
  }

  //  Afficher toutes les users
  readData(table) async {
    var connection = await database;
    return await connection?.query(table);
  }

  // Lire un user
  readDataById(table, itemId) async {
    var connection = await database;
    return connection?.query(table, where: 'id=?', whereArgs: [itemId]);
  }

  //Modifier User
  updateData(table, data) async {
    var connection = await database;
    return await connection
        ?.update(table, data, where: 'id=?', whereArgs: [data['id']]);
  }

  //Supprimer User
  deleteDataById(table, itemId) async {
    var connection = await database;
    return await connection?.rawDelete("delete from $table where id=$itemId");
  }
}
