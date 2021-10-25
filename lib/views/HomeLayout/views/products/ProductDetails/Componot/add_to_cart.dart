import 'package:flutter/material.dart';
import 'package:shop/const/color.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Cubit/cubit.dart';

class AddToCart extends StatelessWidget {
  final int? id;

  AddToCart({this.id});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 45,
          height: 50,
          child: Icon(
            Icons.phone,
            color: defultcolor,
          ),
          decoration: BoxDecoration(
              color: Colors.white54, borderRadius: BorderRadius.circular(3)),
        ),
        Container(
          width: 260,
          height: 50,
          decoration: BoxDecoration(
              color: defultcolor, borderRadius: BorderRadius.circular(3)),
          child: GestureDetector(
            onTap: () {
              CartCubit.of(context).addCart(id!);
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 50, left: 20),
                  child: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.white,
                  ),
                ),
                Text('ADD TO CART',
                    style: TextStyle(color: Colors.white, fontSize: 16))
              ],
            ),
          ),
        )
      ],
    );
  }
}
