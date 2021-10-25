import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shop/views/HomeLayout/views/setting/Screens/edit_profile/view_editProfile.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({Key? key}) : super(key: key);

  @override
  _PinCodeScreenState createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  final String requiredNumber = '1234';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AlertDialog(
      title: const Text('Enter Pin Code'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            PinCodeTextField(
              appContext: context,
              length: 4,
              onChanged: (value) {
                print(value);
              },
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                inactiveColor: Colors.white,
                activeColor: Colors.blue,
                selectedColor: Colors.blueGrey,
              ),
              onCompleted: (value) {
                if (value == requiredNumber) {
                  print('valid pin');
                } else {
                  print('invalid pin');
                }
              },
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Confirm'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EditProfileScreen()));
          },
        ),
      ],
    ));
  }
}
