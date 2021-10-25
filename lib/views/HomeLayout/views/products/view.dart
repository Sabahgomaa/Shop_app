import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/views/HomeLayout/Cubit/cubit.dart';
import 'package:shop/views/HomeLayout/Cubit/states.dart';
import 'package:shop/views/HomeLayout/views/products/components/category.dart';
import 'package:shop/views/HomeLayout/views/products/components/product.dart';

import 'components/slider.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return state is HomeLayoutLoadingState
            ? Text('A')
            : ListView(children: [
                SliderSection(),
                CategorySection(),
                ProductSection(),
              ]);
      },
    );
  }
}
// return ConditionalBuilder(
// condition: HomeLayoutCubit.of(context).homeModel != null &&
// HomeLayoutCubit.of(context).categoriesModel != null,
// builder: (context) => SingleChildScrollView(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// SliderSection(),
// CategorySection(),
// ProductSection(),
// ])),
// fallback: (context) => Center(child: CircularProgressIndicator()),
// );
