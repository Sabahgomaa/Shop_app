import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Screens/Adress/GetAdress/model/get_model.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Screens/Adress/UpdateAdress/Cubit/cubit.dart';
import 'package:shop/widget/button.dart';

import 'Component/field_edit_adress.dart';

class UpdateAddressView extends StatelessWidget {
  final Address? address;
  const UpdateAddressView({this.address});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Address',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          FieldsEditAdaress(),
          BlocBuilder(
              builder: (context, state) => CustomeButton(
                    text: 'Save Changes',
                    function: () =>
                        EditAdressCubit.of(context).upDate(address!.id),
                  ))
        ],
      ),
    );
  }
}
