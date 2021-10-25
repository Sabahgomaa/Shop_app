import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/views/HomeLayout/views/setting/Screens/edit_profile/Cubit/Cubit.dart';

class ProfilePhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = EditProfileCubit.of(context);
    return BlocBuilder(
        bloc: cubit,
        builder: (context, state) => Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image:
                            // cubit.file == null
                            //     ?
                            //NetworkImage(CacheHelper.getData(key: "image"))
                            FileImage(cubit.file),
                      ),
                      border: Border.all(color: Colors.grey)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: TextButton(
                      child: Text(
                        'EditProfile',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w500),
                      ),
                      onPressed: () {
                        cubit.pickPhoto();
                      }),
                )
              ],
            ));
  }
}
