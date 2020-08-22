import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:developer';

import 'package:sqflite/sqlite_api.dart';

class SqliteRepository {
  static SqliteRepository get instance => SqliteRepository();

  factory SqliteRepository() => _singleton;
  static final SqliteRepository _singleton = SqliteRepository._init();

  static Database _database;

  Future<Database> get database async {
    ///Database is already open
    if (_database != null) {
      try {
        await _database.isOpen;
      } catch (e, st) {
        log("erro opening db", stackTrace: st);
        return _createDbFromAsset();
      }
      return _database;
    }

    ///Database is already created in local_storage files
    try {
      final path = join(await getDatabasesPath(), "db.db");

      _database = await openDatabase(path, readOnly: false);
    } catch (e, st) {
      log("Error Database not found in local_storage files $e", stackTrace: st);
    }

    ///Database needs to be created from assets
    if (_database == null) {
      log("Database needs to be created from assets");
      return _createDbFromAsset();
    }
    return _database;
  }

  Future<Database> _createDbFromAsset() async {
    final String path = join(await getDatabasesPath(), "db.db");
    log("Creating new Database from asset");
    // Copy from asset
    try {
      final ByteData data = await rootBundle.load(join("assets", "db.db"));
      final List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes);
    } catch (e, st) {
      log("Asset Bundle not found error:$e", stackTrace: st);
      return null;
    }

    /// open the newly created database
    _database = await openDatabase(path, readOnly: false);
    return _database;
  }

  SqliteRepository._init() {
    database;
  }

  Future<String> getTableSchema(String tableName) async {
    final db = await database;
    final schema = await db.query(tableName);
    final StringBuffer sb = StringBuffer()..writeAll(schema);
    return sb.toString();
  }
}
