import 'package:flutter/material.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Screens/Adress/UpdateAdress/Cubit/cubit.dart';
import 'package:shop/widget/textformfield.dart';

class FieldsEditAdaress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final editAdressCubit = EditAdressCubit.of(context);
    return Form(
        key: EditAdressCubit.of(context).fromKey,
        child: ListView(
          padding: EdgeInsets.all(20),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            CustomeTextFormField(
              label: 'Name',
              controller: editAdressCubit.name,
            ),
            CustomeTextFormField(
              label: 'City',
              controller: editAdressCubit.city,
            ),
            CustomeTextFormField(
              label: 'Region',
              controller: editAdressCubit.region,
            ),
            CustomeTextFormField(
              label: 'Details',
              controller: editAdressCubit.details,
            ),
            CustomeTextFormField(
              label: 'Notes',
              controller: editAdressCubit.notes,
            ),
          ],
        ));
  }
}
