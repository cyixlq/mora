
import 'package:flutter/material.dart';
import 'package:mora/page/home/HomePage.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDB().then((e) => runApp(MyApp()));
}

Future initDB() async {
  var databasePath = await getDatabasesPath();
  final String path = join(databasePath, "jielu.db");
  final createTableSql = <String>['''
          CREATE TABLE PUCH_IN (
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            time INT, 
            year INT, 
            month INT, 
            day INT);
            ''',
          '''
          CREATE TABLE LAST_PUCH_IN (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            tag TEXT,
            time INT,
            count INT
          );
          '''];
  await openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      createTableSql.forEach((element) async {
         await db.execute(element);
      });
      await db.close();
    }
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '戒撸助手',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
