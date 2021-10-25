import 'package:flutter/material.dart';
import 'package:shop/const/color.dart';
import 'package:shop/widget/nav_to.dart';

// ignore: must_be_immutable
class ItemSetting extends StatelessWidget {
  String? txt;
  Widget? widget;
  ItemSetting(this.txt, {this.widget});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 200,
          height: 100,
          color: defultcolor,
          //decoration: BoxDecoration(shape: BoxShape()),
          child: InkWell(
            onTap: () {
              navigateTo(context, widget);
            },
            child: Center(
              child: Text(
                txt!,
                style: TextStyle(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
