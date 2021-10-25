import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Core/Cache/cache_helper.dart';
import 'package:shop/views/AuthCycle/login/Cubit/state.dart';
import 'package:shop/views/AuthCycle/login/model/login_model.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit of(context) => BlocProvider.of(context);
  LoginModel? loginModel;

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());

    try {
      print(email);
      final res =
          await Dio().post('https://student.valuxapps.com/api/login', data: {
        'email': email,
        'password': password,
      });
      loginModel = LoginModel.fromJson(res.data);
      if (loginModel!.status!) {
        CacheHelper.saveData(key: 'token', value: loginModel!.data!.token);
        emit(LoginSuccessState(loginModel!));
      } else {
        emit(LoginErrorState(loginModel!.message!));
      }
    } catch (e, s) {
      print(e);
      print(s);
      emit(LoginErrorState(e.toString()));
    }
  }

  // void userLogin({
  //   required String email,
  //   required String password,
  // }) async {
  //   emit(LoginLoadingState());
  //
  //   try {
  //     DioHelper.postData(
  //       url: LOGIN,
  //       data: {
  //         'email': email,
  //         'password': password,
  //       },
  //     ).then((value) {
  //       print(value.data);
  //       loginModel = LoginModel.fromJson(value.data);
  //       emit(LoginSuccessState(loginModel!));
  //     });
  //     emit(LoginSuccessState(loginModel!));

  IconData suffix = Icons.visibility_outlined;

  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }
}
