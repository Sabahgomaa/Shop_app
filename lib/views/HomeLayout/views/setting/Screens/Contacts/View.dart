import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/views/HomeLayout/views/setting/Screens/Contacts/Components/contact_icon.dart';
import 'package:shop/views/HomeLayout/views/setting/Screens/Contacts/Cubit/cubit.dart';

class ContactView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactsCubit()..getcontact(),
      child: Scaffold(
        appBar: AppBar(),
        body: ContactIcon(),
      ),
    );
  }
}
