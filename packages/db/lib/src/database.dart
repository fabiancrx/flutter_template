import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:sqflite/sqlite_api.dart';

class Db {
  static Db get instance => Db._init();
  static const _dbName = "db.db";
  static Database _database;

  Db._init() {
    database;
  }

  Future<Database> get database async {
    ///Database is already open
    if (_database != null) {
      print('loading db  reference from cache');
      return _database;
    }

    try {
      var path = join(await getDatabasesPath(), _dbName);
      print(path);

      _database = await openDatabase(
        path,
        readOnly: true,
      );
    } catch (e) {
      print("Error Database not found in local files $e");
    }

    ///Database needs to be created from assets
    if (_database == null) {
      print("Database needs to be copied from assets");
      return createDbFromAsset();
    }
    return _database;
  }

  Future<Database> createDbFromAsset() async {
    final String path = join(await getDatabasesPath(), _dbName);
    print("Creating new Database from asset");
    // Copy from asset
    try {
      ByteData data = await rootBundle.load(join("assets", _dbName));
      print('Database size is');
      print(data.elementSizeInBytes / 1024);
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes);
    } catch (e) {
      print("Asset Bundle not found error:$e");
      return null;
    }

    /// open the newly created database
    _database = await openDatabase(path, readOnly: false);
    return _database;
  }

  Future<String> getTableSchema(String tableName) async {
    final db = await database;
    final schema = await db.query(tableName);
    final StringBuffer sb = StringBuffer()..writeAll(schema);
    return sb.toString();
  }
}
