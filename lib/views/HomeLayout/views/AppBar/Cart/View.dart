import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Coponent/cart_list.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Cubit/cubit.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCart(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Cart",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: CartList(),
      ),
    );
  }
}
