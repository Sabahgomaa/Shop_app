import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Core/Dio/dio_helper.dart';
import 'package:shop/Core/Dio/end_pointer.dart';
import 'package:shop/views/AuthCycle/signup/cubit/states.dart';
import 'package:shop/views/AuthCycle/signup/model/signup_model.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit of(context) => BlocProvider.of(context);

  SignUpModel? signupModel;

  void userSignUp({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(SignUpLoadingState());

    try {
      final response = await Dio().post(
        BASE_URL + SIGNUP,
        data: {
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
        },
      );
      print(response.data);
      signupModel = SignUpModel.fromJson(response.data);
      emit(SignUpSuccessState(signupModel!));
    } catch (e, s) {
      print(s);
      emit(SignUpErrorState(e.toString()));
    }

    // .then((value) {
    //   print(value.data);
    //   signupModel = SignUpModel.fromJson(value.data);
    //   emit(SignUpSuccessState(signupModel!));
    // }).catchError((error) {
    //   print(error.toString());
    //   emit(SignUpErrorState(error.toString()));
    // });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(SignUpChangePasswordVisibilityState());
  }
}
