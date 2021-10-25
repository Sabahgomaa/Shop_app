import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shop/Core/Cache/cache_helper.dart';
import 'package:shop/const/color.dart';
import 'package:shop/views/AuthCycle/login/view_login.dart';
import 'package:shop/views/HomeLayout/view.dart';

// ignore: must_be_immutable
class SplashScreen extends StatefulWidget {
  Widget? page;

  String? token = CacheHelper.getData(key: 'token');
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    print(widget.token);
    var duration = Duration(seconds: 5);
    return new Timer(duration, route);
  }

  route() {
    // SplashCubit().getData(context);
    if (widget.token != null) {
      widget.page = HomeLayout();
    } else {
      widget.page = LoginScreen();
    }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => widget.page!));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: defultcolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(child: Image.asset("assets/images/shopapp.png")),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              " Shop App",
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ],
        ),
      ),
    );
  }
}
