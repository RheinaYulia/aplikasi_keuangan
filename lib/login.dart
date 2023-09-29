import 'package:aplikasi_keuangan/konstan/konstan_keuangan.dart';
import 'package:aplikasi_keuangan/controller/sql_helper.dart';
import 'package:aplikasi_keuangan/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aplikasi_keuangan/controller/user_provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Add a GlobalKey<FormState> for form validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Add a DbHelper instance
  final DbHelper dbHelper = DbHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey, // Assign the form key
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Center(
                  child: SizedBox(
                    width: 200,
                    height: 150,
                  ),
                ),
              ),
              SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.network(
                      'https://cdn3.iconfinder.com/data/icons/start-up-4/44/money-512.png') // Replace with your logo asset
                  ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                  controller: usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'username',
                    hintText: "Enter valid username",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password',
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 100,
                margin: const EdgeInsets.only(top: 30.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, attempt to log in
                      final username = usernameController.text;
                      final password = passwordController.text;

                      // Call the login function from DbHelper
                      final loginSuccessful =
                          await dbHelper.loginUser(username, password);

                      if (loginSuccessful) {
                        // fetch user data
                        final userProvider =
                            Provider.of<UserProvider>(context, listen: false);
                        await userProvider.fetchUserByusername(username);

                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => Home()));
                      } else {
                        // Show an error message to the user
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Login Failed'),
                            content: const Text('Invalid username or password'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// SizedBox(
//                     width: 150,
//                     height: 150,
//                     child: Image.network(
//                         'https://cdn3.iconfinder.com/data/icons/start-up-4/44/money-512.png') // Replace with your logo asset
//                     ),