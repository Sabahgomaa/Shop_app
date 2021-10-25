import 'package:flutter/material.dart';
import 'package:shop/const/color.dart';
import 'package:shop/views/AuthCycle/forgetPasswoed/view_forgetpassword.dart';

class SignUpFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'already have an account?',
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgetPasswordScreen()));
              },
              child: Text(
                'Login',
                style: TextStyle(color: defultcolor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
