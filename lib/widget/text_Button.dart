import 'package:flutter/material.dart';
import 'package:shop/const/color.dart';

// ignore: must_be_immutable
class CustomeTextButton extends StatelessWidget {
  Function() function;
  String text;
  CustomeTextButton({required this.text, required this.function});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
        style: TextStyle(color: defultcolor),
      ),
    );
  }
}
