import 'package:flutter/material.dart';

class HaederChangePassword extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'FOGGET PASSWORD',
          style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Text(
        // 'sign in to continue',
        // style: TextStyle(
        // fontSize: 15,
        // color: Colors.grey
        // ),
        // ),
        SizedBox(
          height: 40.0,
        ),

      ],
    );
  }
}
