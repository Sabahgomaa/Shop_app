import 'package:flutter/material.dart';
import 'package:shop/widget/textformfield.dart';

// ignore: must_be_immutable
class BodyForget extends StatelessWidget {
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: CustomeTextFormField(
        isPassword: false,
        controller: emailController,
        label: 'Email',
        type: TextInputType.emailAddress,
        prefix: Icons.email,
        validate: (value) {
          if (value.isEmpty) {
            return 'email address must not be empty';
          }
          return null;
        },
        onChange: (String value) {
          print(value);
        },
        onSubmit: (String value) {
          print(value);
        },
      ),
    );
  }
}
