import 'package:flutter/material.dart';
import 'package:shop/Core/Cache/cache_helper.dart';
import 'package:shop/views/HomeLayout/views/setting/Screens/edit_profile/Cubit/Cubit.dart';
import 'package:shop/widget/textformfield.dart';

// ignore: must_be_immutable
class Fields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = EditProfileCubit.of(context);
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomeTextFormField(
            controller: cubit.nameController,
            label: CacheHelper.getData(key: "name"),
            prefix: Icons.person_outline,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: CustomeTextFormField(
              controller: cubit.phoneController,
              label: CacheHelper.getData(key: "phone"),
              prefix: Icons.phone,
            ),
          ),
          CustomeTextFormField(
            controller: cubit.emailController,
            label: CacheHelper.getData(key: "email"),
            prefix: Icons.email,
          ),
        ]));
  }
}
