import 'dart:developer';

import 'package:aplikasi_keuangan/controller/logincontroller.dart';
import 'package:aplikasi_keuangan/main.dart';
import 'package:aplikasi_keuangan/pages/home.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';

import '../model/usermodel.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database? _db;
  final String tableUser = "User";
  final String columnName = "name";
  final String columnUserName = "username";
  final String columnPassword = "password";

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "main.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE User(id INTEGER PRIMARY KEY, name TEXT, username TEXT, password TEXT, flaglogged TEXT)");
    print("Table is created");
  }

  //insertion
  Future<int> saveUser(var user) async {
    var dbClient = await db;
    print(user.name);
    int res = await dbClient.insert("User", user.toMap());
    List<Map> list = await dbClient.rawQuery('SELECT * FROM User');
    print(list);
    return res;
  }

  //deletion
  Future<int> deleteUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.delete("User");
    return res;
  }

  Future<dynamic> selectUser(user) async {
    print("Select User");
    print(user.username);
    print(user.password);
    var dbClient = await db;
    List<Map> maps = await dbClient.query(tableUser,
        columns: [columnUserName, columnPassword],
        where: "$columnUserName = ? and $columnPassword = ?",
        whereArgs: [user.username, user.password],
        limit: 1);
    print(maps);
    if (maps.isNotEmpty) {
      log(maps.toString());

      Fluttertoast.showToast(msg: "User Exist").then((value) async {
        Get.find<LoginController>().userdetails = await getuser(user.username);
        Get.offAll(() => Home());
      });
      return user;
    } else {
      Fluttertoast.showToast(msg: "User Not Exist");
      log("User Not Exist");
      return null;
    }
  }

  Future getusers() async {
    var dbClient = await db;
    var res = await dbClient.query('User', orderBy: "id");
    // var raw = await dbClient
    //     .rawUpdate("Update User set flaglogged = true where id = 1");
    // final db = await db;
    // log(raw.toString());
    log(res.toString());
  }

  Future getuser(var username) async {
    var dbClient = await db;
    var res = await dbClient.query('User', where: "username='$username'");
    // final db = await db;
    print(res.toString());
    return res;
  }
}
