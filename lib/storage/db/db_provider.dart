import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbProvider {
  static final DbProvider _instance = DbProvider._internal();
  late Database _database;



  factory DbProvider() {
    return _instance;
  }

  DbProvider._internal();
  Database get database =>_database;

  Future<void> initDb() async {
    // لتحديد ايم يتم تخزين البيانات لكل بيئه عمل على حدى getApplicationDocumentsDirectory
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'app_db.sql');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: ( db, version) {
        db.execute(
            'CREATE TABLE notes ('
                'id INTEGER PRIMARY KEY AUTOINCREMENT,'
                'name TEXT '
                ')');

      },
      onOpen: ( db) {},
      onDowngrade: (db, oldVersion, newVersion) {},
      onUpgrade: (db, oldVersion, newVersion) {},
    );
  }
}
