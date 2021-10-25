import 'package:flutter/material.dart';
import 'package:shop/views/AuthCycle/forgetPasswoed/Components/Footer.dart';
import 'package:shop/views/AuthCycle/forgetPasswoed/Components/body.dart';
import 'package:shop/views/AuthCycle/forgetPasswoed/Components/hearder.dart';

class ForgetPasswordScreen extends StatefulWidget {

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {



  var isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
        padding: const EdgeInsets.all(20.0),
    child: Center(
    child: SingleChildScrollView(
       physics: BouncingScrollPhysics(),
         child:Column(
           children: [
             HeaderForget(),
             BodyForget(),
             FooterForget(),
           ])

)
    )
    )
    );
  }
}
