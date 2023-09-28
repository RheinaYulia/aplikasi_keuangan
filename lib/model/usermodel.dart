class User {
  String? _name;
  String? _username;
  String? _password;
  String? _flaglogged;

  User(this._name, this._username, this._password, this._flaglogged);

  User.map(dynamic obj) {
    _name = obj['name'];
    _username = obj['username'];
    _password = obj['password'];
    _flaglogged = obj['password'];
  }

  String? get name => _name;
  String? get username => _username;
  String? get password => _password;
  String? get flaglogged => _flaglogged;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["username"] = _username;
    map["password"] = _password;
    map["flaglogged"] = _flaglogged;
    return map;
  }
}
