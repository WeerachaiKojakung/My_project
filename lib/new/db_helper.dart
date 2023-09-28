//ในไฟล์ db_helper.dart
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute('drop table if exists data');
    await database.execute('drop table if exists medicine');
    await database.execute('''
      create table medicine (
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        desc TEXT,
        aa TEXT,
        bb TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
    ''');
    await database.execute("""CREATE TABLE data (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      title TEXT,
      desc TEXT,
      aa TEXT,
      bb TEXT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)""");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      "database_name.db",
      version: 4, // เพิ่มเวอร์ชันของฐานข้อมูล
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
      onUpgrade: (db, oldVersion, newVersion) async =>
          await createTables(db), //เพิ่มอัพเดรท ไม่ต้องลบใหม่
    );
  }

  static Future<int> createData(
      String title,
      String? desc, // พารามิเตอร์ที่เป็นตัวเลือก
      String? aa, // พารามิเตอร์ที่เป็นตัวเลือก
      String? bb, // พารามิเตอร์ที่เป็นตัวเลือก
      {String? imageUrl, String tableName = 'data'}) async {
    final db = await SQLHelper.db();

    final data = {
      'title': title,
      'desc': desc,
      'aa': aa, // รวม 'aa' ในฟิลด์
      'bb': bb, // รวม 'bb' ในฟิลด์
      'imageUrl': imageUrl, // เพิ่ม imageUrl
    };
    final id = await db.insert(tableName, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

  static Future<List<Map<String, dynamic>>> getAllData(
      {String tableName = 'data'}) async {
    final db = await SQLHelper.db();
    return db.query(tableName, orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getSingleData(int id,
      {String tableName = 'data'}) async {
    final db = await SQLHelper.db();
    return db.query(tableName, where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateData(
      int id,
      String title,
      String? desc, // พารามิเตอร์ที่เป็นตัวเลือก
      String? aa, // พารามิเตอร์ที่เป็นตัวเลือก
      String? bb, // พารามิเตอร์ที่เป็นตัวเลือก
      {String? imageUrl, String tableName = 'data'}) async {
    final db = await SQLHelper.db();
    final data = {
      'title': title,
      'desc': desc,
      'aa': aa, // รวม 'aa' ในฟิลด์
      'bb': bb, // รวม 'bb' ในฟิลด์
      'imageUrl': imageUrl, // เพิ่ม imageUrl
      'createdAt': DateTime.now().toString()
    };
    final result =
        await db.update(tableName, data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteData(int id, {String tableName = 'data'}) async {
    final db = await SQLHelper.db();
    try {
      await db.delete(tableName, where: "id = ?", whereArgs: [id]);
    } catch (e) {}
  }
}
