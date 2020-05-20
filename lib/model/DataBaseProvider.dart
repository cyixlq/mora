import 'package:mora/model/bean/PunchInCount.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'bean/Date.dart';

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

  // 打卡
  Future<int> punchIn(PunchInCount punchInCount, Date date, bool punchInIsNull) async {
    if (_db == null) {
      await open();
    }
    return await _db.transaction((txn) async {
      if (!punchInIsNull)
        await txn.update("LAST_PUCH_IN", punchInCount.toMap());
      else
        await txn.insert("LAST_PUCH_IN", punchInCount.toMap());
      return await txn.insert("PUCH_IN", date.toMap());
    });
  }

  Future<int> insertDate(Date date) async {
    if (_db == null) {
      await open();
    }
    return await _db.insert("PUCH_IN", date.toMap());
  }

  // 获取某年某月的打卡记录
  Future<List<Date>> getDateList(int year, int month) async {
    if (_db == null) {
      await open();
    }
    List<Map> result = await _db.query(
        "PUCH_IN",
        where: "year = ? and month = ?",
        whereArgs: [year, month]
    );
    if (result.length > 0) {
      return result.map((e) => Date.fromMap(e)).toList();
    }
    return null;
  }

  Future close() async {
    if(_db != null) {
      await _db.close();
      _db = null;
    }
  }
}
