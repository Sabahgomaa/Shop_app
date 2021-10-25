import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop/Core/Cache/cache_helper.dart';
import 'package:shop/Core/Dio/end_pointer.dart';
import 'package:shop/views/HomeLayout/views/setting/Screens/edit_profile/Cubit/States.dart';

class EditProfileCubit extends Cubit<EditProfileStates> {
  EditProfileCubit(this.file) : super(EditProfileLoading());

  static EditProfileCubit of(context) => BlocProvider.of(context);

  File file;
  TextEditingController nameController =
      TextEditingController(text: CacheHelper.getData(key: "name"));
  TextEditingController phoneController =
      TextEditingController(text: CacheHelper.getData(key: "phone"));
  TextEditingController emailController =
      TextEditingController(text: CacheHelper.getData(key: "email"));

  Future<void> updata() async {
    emit(EditProfileLoading());
    final token = CacheHelper.getData(key: 'token');

    final formData = {
      "name": nameController.text,
      "phone": phoneController.text,
      "email": emailController.text,
      "password": "123456",
      if (file != null) "image": base64Encode(file.readAsBytesSync())
    };
    try {
      final response = await Dio().put(
        baseURL + UPDATE,
        options: Options(headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
          'lang': 'ar'
        }),
        data: formData,
      );
      print(CacheHelper.getData(key: "name"));
      await CacheHelper.saveData(
          key: "token", value: response.data['data']['token']);
      await CacheHelper.saveData(
          key: "name", value: response.data['data']['name']);
      await CacheHelper.saveData(
          key: "email", value: response.data['data']['email']);
      await CacheHelper.saveData(
          key: "phone", value: response.data['data']['phone']);
      await CacheHelper.saveData(
          key: "image", value: response.data['data']['image']);
      print(CacheHelper.getData(key: "image"));
    } catch (e) {
      print(e);
    }
    emit(EditProfileInit());
  }

  void pickPhoto() async {
    final pickFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickFile == null) return;
    file = File(pickFile.path);
    emit(EditProfileInit());
  }

  @override
  Future<void> close() {
    nameController.dispose();
    return super.close();
  }
}
