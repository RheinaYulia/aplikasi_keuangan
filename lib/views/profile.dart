import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/logincontroller.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Name: ${Get.find<LoginController>().userdetails[0]["name"]}",
            ),
            Text(
              "Username: ${Get.find<LoginController>().userdetails[0]["username"]}",
            ),
          ],
        ),
      ),
    );
  }
}
