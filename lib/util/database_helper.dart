import 'dart:io';

//import 'package:fluttersqflite/models/user.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../beans/FileInfo.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "tqjl.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE FileInfo("
        "id INTEGER PRIMARY KEY,"
        " uuid TEXT,"
        " ywid TEXT"
        " ywlx TEXT"
        " protype TEXT"
        " problem TEXT"
        " description TEXT"
        " filepath TEXT"
        " filename TEXT"
        " datetype TEXT"
        " searchdate TEXT"
        " createtime TEXT"
        " systemtime TEXT"
        " filesize TEXT"
        " mediatype TEXT"
        " urlpath TEXT"
        " savetype TEXT"
        " lat TEXT"
        " lot TEXT"
        " locationname TEXT"
        " urlPara TEXT"
        " ycdbh TEXT"
        " chkbh TEXT"
        ")");
    print("Table is created");
  }

  /**
   * 保存文件
   */
  Future<int> saveFileInfo(FileInfo fileInfo) async {
    var dbClient = await db;
    int res = await dbClient.insert("FileInfo", fileInfo.toMap());
    return res;
  }
//
//  //deletion
//  Future<int> deleteUser(User user) async {
//    var dbClient = await db;
//    int res = await dbClient.delete("User");
//    return res;
//  }
}
