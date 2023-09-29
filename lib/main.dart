import 'package:aplikasi_keuangan/konstan/route_constant.dart';
import 'package:aplikasi_keuangan/pages/spend.dart';
import 'package:aplikasi_keuangan/pages/income.dart';
import 'package:aplikasi_keuangan/pages/cashflow.dart';
import 'package:aplikasi_keuangan/pages/home.dart';
import 'package:aplikasi_keuangan/login.dart';
import 'package:aplikasi_keuangan/pages/setting.dart';
import 'package:aplikasi_keuangan/controller/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
    ],
    child: const MyApp()));
}

final routes = {
  loginRoute: (BuildContext context) => LoginPage(),
  homeRoute: (BuildContext context) => Home(),
  settingsRoute: (BuildContext context) => SettingsPage(),
  addExpenseRoute: (BuildContext context) => Spend(),
  addIncomeRoute: (BuildContext context) => EntryForm(),
  detailCashFlowRoute: (BuildContext context) => CashFlow(),
};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cashflow App",
      routes: routes,
    );
  }
}
