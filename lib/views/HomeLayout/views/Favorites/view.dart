import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/views/HomeLayout/Cubit/cubit.dart';
import 'package:shop/views/HomeLayout/Cubit/states.dart';
import 'package:shop/views/HomeLayout/views/Favorites/component/favority_item.dart';
import 'package:shop/widget/my_Drvider.dart';

class FavorityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (HomeLayoutCubit.of(context).favoritesModel == null ||
              HomeLayoutCubit.of(context).favoritesModel!.data!.data!.isEmpty)
            return Text('Empty');
          return ListView.separated(
            itemBuilder: (BuildContext context, int index) => FavoritiesItem(
                HomeLayoutCubit.of(context).favoritesModel!.data!.data![index]),
            separatorBuilder: (context, index) => MyDivider(),
            itemCount:
                HomeLayoutCubit.of(context).favoritesModel!.data!.data!.length,

            // fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        });
  }
}
