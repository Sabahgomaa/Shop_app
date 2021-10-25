import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/views/HomeLayout/views/setting/Screens/edit_profile/Component/body.dart';
import 'package:shop/views/HomeLayout/views/setting/Screens/edit_profile/Component/profile_photo.dart';
import 'package:shop/views/HomeLayout/views/setting/Screens/edit_profile/Cubit/Cubit.dart';
import 'package:shop/views/HomeLayout/views/setting/Screens/edit_profile/Cubit/States.dart';
import 'package:shop/widget/button.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var isPassword = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => EditProfileCubit.of(context),
        child: Scaffold(
            appBar: AppBar(
              title: Text('EditProfile'),
            ),
            body: ListView(
              padding: EdgeInsets.symmetric(vertical: 30),
              physics: BouncingScrollPhysics(),
              children: [
                ProfilePhoto(),
                Fields(),
                BlocBuilder(
                    builder: (context, state) => state is EditProfileLoading
                        ? CircularProgressIndicator()
                        : CustomeButton(
                            text: 'Save',
                            function: () {
                              EditProfileCubit.of(context).updata();
                            },
                          ))
              ],
            )));
  }
}
