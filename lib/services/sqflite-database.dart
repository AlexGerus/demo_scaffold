import 'dart:io';

import 'package:demo_scaffold/models/person.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getInstance() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  var path = join(documentsDirectory.path, 'DemoDB.db');

  return await openDatabase(path,
      version: 1,
      onOpen: (db) => {
            // Any operation on open
          },
      onCreate: (Database db, int version) async => {
            await db.execute("CREATE TABLE Person ("
                "id INTEGER PRIMARY KEY,"
                "name TEXT,"
                "age INTEGER"
                ")")
          },
      onUpgrade: (Database db, int oldVersion, int newVersion) {
        // Write code to deal with upgrades here
      },
      onDowngrade: (Database db, int oldVersion, int newVersion) {
        // Write code to deal with downgrades here
      });
}

Future<int> createValue(Person person) async {
  var db = await getInstance();
  var result = await db.insert('Person', person.toJson());
  return result;
}

Future<List<Person>> readValue(String id) async {
  var db = await getInstance();
  var result = await db.query('Person', where: "id = ?", whereArgs: [id]);
  return result.map((item) => Person.fromJson(item)).toList();
}

Future<int> updateValue(Person person) async {
  var db = await getInstance();
  var result = await db.update('Person', person.toJson(), where: "id = ?", whereArgs: [person.id]);
  return result;
}

Future<int> deleteValue(String id) async {
  var db = await getInstance();
  var result = await db.delete('Person', where: "id = ?", whereArgs: [id]);
  return result;
}