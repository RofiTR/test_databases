import 'dart:io';


import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_databases/product_model.dart';

class DatabaseInstance {
  final String _databaseName = 'my_database.db';
  final int _databaseversion = 1;


  // Product Table
  final String table = 'table';
  final String id = 'id';
  final String name = 'name';
  final String category = 'category';
  final String createdAt = 'createdAt';
  final String updatedAt = 'updatedAt';

  Database? _database;
  Future<Database> database() async {
    if (_database != null) return _database!;
    _database = await _initDatabases();
    return _database!;
  }



  Future _initDatabases() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return openDatabase(path, version: _databaseversion, onCreate: _onCreate);
  }


  Future _onCreate(Database db, int version) async{
    await db.execute('CREATE TABLE $table ($id INTEGER PRIMARY KEY, $name TEXT NULL, $category TEXT NULL,$createdAt TEXT NULL, $updatedAt TEXT NULL)');
  }

  Future<List<ProductModel>> all() async{
    final data = await _database!.query(table);
    List<ProductModel> result = 
      data.map((e) => ProductModel.fromJson (e)).toList();
      print(result) ;
      return result;
  }

  Future<int> insert(Map<String, dynamic> row) async {
    final query = await _database!.insert(table, row);
    return query;

  }
}