import 'package:flutter/foundation.dart';

class User extends ChangeNotifier {
  int? _id;
  String? _username;
  String? _password;

  int? get id => _id;

  String? get username => this._username;
  set username(String? value) {
    this._username = value;
    notifyListeners();
  }

  String? get password => this._password;
  set password(String? value) {
    this._password = value;
    notifyListeners();
  }

  // konstruktor versi 1
  User(this._username, this._password,
      {required String username, required String password});

  // konstruktor versi 2: konversi dari Map ke Item
  User.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    _username = map['username'];
    _password = map['password'];
  }

  // konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = _id;
    map['username'] = username;
    map['password'] = password;
    return map;
  }
}
