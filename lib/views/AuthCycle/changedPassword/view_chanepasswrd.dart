import 'package:flutter/material.dart';
import 'package:shop/views/AuthCycle/changedPassword/Component/body.dart';
import 'package:shop/views/AuthCycle/changedPassword/Component/footer.dart';
import 'package:shop/views/AuthCycle/changedPassword/Component/header.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
                child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  HaederChangePassword(),
                  BodyChangepassword(),
                  FooterChangePassword(),
                ],
              ),
            ))));
  }
}
