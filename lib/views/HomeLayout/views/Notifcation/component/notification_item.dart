import 'package:flutter/material.dart';
import 'package:shop/const/color.dart';
import 'package:shop/views/HomeLayout/model/notification_model.dart';

// ignore: must_be_immutable
class NotificationItem extends StatelessWidget {
  Datum? notificationmodel;
  NotificationItem(this.notificationmodel);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.bottomStart, children: [
      Column(children: [
        Text(
          notificationmodel!.title.toString(),
          style: TextStyle(
            fontSize: 12.0,
            color: defultcolor,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          notificationmodel!.message.toString(),
          style: TextStyle(
            fontSize: 10.0,
            color: Colors.grey,
            decoration: TextDecoration.lineThrough,
          ),
        )
      ]),
    ]);
  }
}
