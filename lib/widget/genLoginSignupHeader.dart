import 'package:flutter/material.dart';

class genLoginSignupHeader extends StatelessWidget {
  String headerName;

  genLoginSignupHeader(this.headerName);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 50.0),
          Text(
            headerName,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontSize: 40.0),
          ),
          SizedBox(height: 40.0),
          Icon(
            Icons.monetization_on_sharp,
            color: Colors.blue,
            size: 100,
          ),
          // Image.asset(
          //   "images/amico.jpg",
          //   fit: BoxFit.fill,
          // ),
          SizedBox(height: 60.0),
        ],
      ),
    );
  }
}
