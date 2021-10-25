import 'package:shop/views/AuthCycle/signup/model/signup_model.dart';

abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {
  final SignUpModel signUpModel;

  SignUpSuccessState(this.signUpModel);
}

class SignUpErrorState extends SignUpStates {
  final String error;

  SignUpErrorState(this.error);
}

class SignUpChangePasswordVisibilityState extends SignUpStates {}
