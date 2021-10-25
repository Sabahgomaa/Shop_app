import 'package:flutter/material.dart';
import 'package:shop/widget/textformfield.dart';

// ignore: must_be_immutable
class BodyChangepassword extends StatelessWidget {
  var confirmpasswordController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  var isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            CustomeTextFormField(
              isPassword: false,
              controller: passwordController,
              label: 'Password',
              type: TextInputType.visiblePassword,
              prefix: Icons.lock,
              //     suffix: isPassword? Icons.visibility:Icons.visibility_off ,
              //     isPassword: isPassword,
              //
              //     validate: (value) {
              //   if (value!.isEmpty) {
              //     return 'password is too short';
              //   }
              //
              //   return null;
              // },
              // suffixPressed: () {
              // setState(() {
              // isPassword = !isPassword;
              // });
            ),
            SizedBox(
              height: 15.0,
            ),
            CustomeTextFormField(
              controller: confirmpasswordController,
              label: 'Confirm Password',
              type: TextInputType.visiblePassword,
              isPassword: false,
              //prefix: Icons.lock,
              // suffix: isPassword? Icons.visibility:Icons.visibility_off ,
              // isPassword: isPassword,
              // validate: (value) {
              // if (value!.isEmpty) {
              // return 'password is too short';
              // }
              //
              // return null;
              // },
              // suffixPressed: () {
              // setState(() {
              // isPassword = !isPassword;
              // });
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ));
  }
}
