import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/views/AuthCycle/login/Cubit/cubit.dart';
import 'package:shop/views/AuthCycle/login/Cubit/state.dart';
import 'package:shop/views/AuthCycle/login/units/login_footer.dart';
import 'package:shop/views/AuthCycle/login/units/login_header.dart';
import 'package:shop/views/AuthCycle/login/units/loginform.dart';
import 'package:shop/views/HomeLayout/view.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => LoginCubit(),
        child:
            BlocConsumer<LoginCubit, LoginStates>(listener: (context, state) {
          if (state is LoginSuccessState) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => HomeLayout(),
            ));
            if (state.loginModel.message != null) {
              print(state.loginModel.message);
              print(state.loginModel.data!.token);
            } else {
              print(state.loginModel.message);
            }
          } else if (state is LoginErrorState) print(state.error);
        }, builder: (context, state) {
          return Scaffold(
              body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Form(
                  child: Column(children: [
                    LoginHeader(),
                    SizedBox(
                      height: 40.0,
                    ),
                    LoginFields(),
                    SizedBox(
                      height: 10.0,
                    ),
                    LoginFooter(),
                  ]),
                ),
              ),
            ),
          ));
        }));
  }
}
