// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shop/Core/Cache/cache_helper.dart';
// import 'package:shop/views/Home/View.dart';
// import 'package:shop/views/login/view_login.dart';
// import 'package:shop/views/splash/Cubit/states.dart';
//
// class SplashCubit extends Cubit<SplashStates> {
//   SplashCubit() : super(SplashInitial());
//   static SplashCubit of(context) => BlocProvider.of(context);
//
//   Future<void> getData(context) async {
//     final prefs = await CacheHelper.getData(key: 'token');
//     final idToken = prefs.getString('idToken');
//     if (idToken == null)
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (ctx) => LoginScreen()));
//     else
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (ctx) => HomeScreen()));
//   }
// }
