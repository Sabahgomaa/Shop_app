import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/const/color.dart';
import 'package:shop/views/HomeLayout/views/setting/Screens/FAQs/Component/expension_tile.dart';
import 'package:shop/views/HomeLayout/views/setting/Screens/FAQs/Cubit/cubit.dart';

class FAQsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => FAQsCubit()..getFAQs(),
        child: Scaffold(
          body: ListView(
            children: [
              Text(
                'Ask us a question',
                style: TextStyle(color: defultcolor, fontSize: 25),
                textAlign: TextAlign.center,
              ),
              ExpensionTile(),
            ],
          ),
        ));
  }
}
