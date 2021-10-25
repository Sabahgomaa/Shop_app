import 'package:flutter/material.dart';
import 'package:shop/views/HomeLayout/views/setting/Screens/edit_profile/view_editProfile.dart';
import 'package:shop/widget/button.dart';

class FooterChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomeButton(
      text: 'login',
      function: () {
        // if (formKey.currentState!.validate()) {}
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EditProfileScreen()));
      },
    );
  }
}
