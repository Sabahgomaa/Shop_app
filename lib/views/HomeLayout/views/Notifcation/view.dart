import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/views/HomeLayout/Cubit/cubit.dart';
import 'package:shop/views/HomeLayout/Cubit/states.dart';
import 'package:shop/views/HomeLayout/views/Notifcation/component/notification_item.dart';
import 'package:shop/widget/my_Drvider.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (HomeLayoutCubit.of(context).notificationModel == null ||
              HomeLayoutCubit.of(context)
                  .notificationModel!
                  .data!
                  .data!
                  .isEmpty) return Text("Empty");
          return ListView.separated(
            itemBuilder: (context, index) => NotificationItem(
              HomeLayoutCubit.of(context).notificationModel!.data!.data![index],
              // .categoriesModel!
              // .data!
              // .data![index]
            ),
            separatorBuilder: (context, index) => MyDivider(),
            itemCount: HomeLayoutCubit.of(context)
                .notificationModel!
                .data!
                .data!
                .length,
          );
        });
  }
}
