import 'package:mora/model/bean/PunchInCount.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseProvider {
  Database _db;

  Future open() async {
    var databasePath = await getDatabasesPath();
    final String path = join(databasePath, "jielu.db");
    _db = await openDatabase(path);
  }

  Future<int> insertLastPunchIn(PunchInCount data) async {
    if (_db == null) {
      await open();
    }
    return await _db.insert("LAST_PUCH_IN", data.toMap());
  }

  Future<int> updateLastPunchIn(PunchInCount data) async {
    if (_db == null) {
      await open();
    }
    return await _db.update("LAST_PUCH_IN", data.toMap(),
      where: "tag = ?",
      whereArgs: ["punch_in_count"]
    );
  }

  Future<int> saveLastPunchIn(PunchInCount data) async {
    if (_db == null) {
      await open();
    }
    PunchInCount result = await getLastPunchIn();
    if (result != null) {
      return await updateLastPunchIn(data);
    } else {
      return await insertLastPunchIn(data);
    }
  }

  Future<PunchInCount> getLastPunchIn() async {
    if (_db == null) {
      await open();
    }
    List<Map> result = await _db.query(
      "LAST_PUCH_IN",
      where: "tag = ?",
      whereArgs: ["punch_in_count"]
    );
    if(result.length > 0)
      return PunchInCount.fromMap(result.first);
    return null;
  }

  Future close() async {
    if(_db != null)
      await _db.close();
  }
}
