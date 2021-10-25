import 'package:flutter/material.dart';

class HeaderForget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
      'FOGGET PASSWORD',
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      )
    ),
    SizedBox(
    height: 40.0,
    )
    ]
    );
  }
}
