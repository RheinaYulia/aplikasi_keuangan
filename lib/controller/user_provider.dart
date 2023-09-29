import 'package:flutter/foundation.dart';
import 'package:aplikasi_keuangan/model/usermodel.dart'; // Import your User model
import 'package:aplikasi_keuangan/controller/sql_helper.dart'; // Import your DbHelper class

class UserProvider extends ChangeNotifier {
  User? _user;
  final DbHelper dbHelper = DbHelper(); // Create an instance of your DbHelper

  User? get user => _user;

  // Fetch user data by username
  Future<void> fetchUserByusername(String username) async {
    final user = await dbHelper.getUserByusername(username);
    if (user != null) {
      _user = user;
      notifyListeners(); // Notify listeners of the change in user data
    }
  }
}
