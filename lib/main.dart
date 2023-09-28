import 'package:aplikasi_keuangan/login.dart';
import 'package:aplikasi_keuangan/pages/cashflow.dart';
import 'package:aplikasi_keuangan/pages/home.dart';
import 'package:aplikasi_keuangan/pages/income.dart';
import 'package:aplikasi_keuangan/pages/spend.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD UI',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
    );
  }
}
