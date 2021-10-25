import 'package:flutter/material.dart';
import 'package:shop/views/AuthCycle/changedPassword/view_chanepasswrd.dart';
import 'package:shop/widget/button.dart';

class FooterForget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height:20.0 ,),
      CustomeButton(
        text: 'Confirm',
         function: () {
        //   if (formKey.currentState!.validate()) {
        //   }
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePasswordScreen()));
        },
      ),
    ],
    );
  }
}
