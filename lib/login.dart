import 'dart:developer';
import 'package:aplikasi_keuangan/controller/logincontroller.dart';
import 'package:aplikasi_keuangan/main.dart';
import 'package:aplikasi_keuangan/views/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/sql_helper.dart';
import '../model/UserModel.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _contro = Get.put(LoginController());
  bool _isLoading = false;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String? _email, _password;

  void _register() {
    Get.to(() => SignUp());
  }

  @override
  Widget build(BuildContext context) {
    var loginBtn = Container(
        height: 50,
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ElevatedButton(
          child: const Text('Login'),
          onPressed: () async {
            var db = DatabaseHelper();
            // db.getusers();
            db.getuser(_email);
            if (formKey.currentState!.validate()) {
              var user = User(null, _email, _password, null);
              // var db = DatabaseHelper();
              var userRetorno = User(null, null, null, null);
              userRetorno = (await db.selectUser(user)) as User;
              // ignore: unnecessary_null_comparison
              if (userRetorno != null) {
                log(userRetorno.toString());
              } else {
                log(userRetorno.toString());
              }
            }
          },
        ));

    var loginForm = Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text(
            "LOGO",
            textScaleFactor: 2.0,
          ),
          const SizedBox(
            height: 30,
          ),
          Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Username";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _email = value;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Password";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _password = value;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: const EdgeInsets.all(10.0), child: loginBtn),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Does not have account?'),
              TextButton(
                onPressed: _register,
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login Page"),
      ),
      key: scaffoldKey,
      body: Center(
        child: loginForm,
      ),
    );
  }
}
