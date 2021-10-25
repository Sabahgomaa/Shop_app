import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/views/HomeLayout/Cubit/cubit.dart';
import 'package:shop/views/HomeLayout/Cubit/states.dart';
import 'package:shop/widget/my_Drvider.dart';

import 'component/category_item.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView.separated(
            itemBuilder: (context, index) => CatogtyItem(
                HomeLayoutCubit.of(context)
                    .categoriesModel!
                    .data!
                    .data![index]),
            separatorBuilder: (context, index) => MyDivider(),
            itemCount:
                HomeLayoutCubit.of(context).categoriesModel!.data!.data!.length,
          );
        });
  }
}
