import 'package:flutter/material.dart';
import 'package:shop/widget/button.dart';

class FootereditProfile extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      SizedBox(
      height: 20.0,
    ),
    Center(
    child: TextButton(
    onPressed: () {},
    child: Text(
    'Edit Profile',
    ),
    ),
    ),
    SizedBox(
    height: 40.0,
    ),
    CustomeButton(
    text: 'Confirm',
    function: () {
    // if (formKey.currentState!.validate()) {}
    },
    )
    ],
    );
  }
}
