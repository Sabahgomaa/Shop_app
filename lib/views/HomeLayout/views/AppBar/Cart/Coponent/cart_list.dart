import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/const/color.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Coponent/cart_item.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Cubit/cubit.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Cubit/states.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Screens/CheckOut/view.dart';
import 'package:shop/widget/button.dart';

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
        builder: (context, state) => state is CartViewLoading
            ? CartCubit.of(context).addCartModel == null
                ? Text('No Result')
                : Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: CartCubit.of(context)
                            .addCartModel!
                            .data!
                            .cartItems!
                            .length,
                        itemBuilder: (context, index) {
                          final cart = CartCubit.of(context)
                              .addCartModel!
                              .data!
                              .cartItems![index]
                              .product;
                          return CartItems(
                            index: index,
                            cubit: CartCubit.of(context),
                            name: cart!.name,
                            image: cart.image,
                            cartId: CartCubit.of(context)
                                .addCartModel!
                                .data!
                                .cartItems![index]
                                .id,
                            quantity: CartCubit.of(context)
                                .addCartModel!
                                .data!
                                .cartItems![index]
                                .quantity,
                            price: cart.price.toString(),
                            oldPrice: cart.oldPrice.toString(),
                            isFavourite: cart.inFavorites,
                            isDiscount: cart.discount == 0,
                          );
                        }),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Total :',
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          CartCubit.of(context)
                              .addCartModel!
                              .data!
                              .total
                              .toString(),
                          style: TextStyle(fontSize: 25, color: defultcolor),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'EGP',
                          style: TextStyle(fontSize: 25, color: defultcolor),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: Colors.grey),
                    ),
                    height: 70,
                  ),
                  if (CartCubit.of(context)
                      .addCartModel!
                      .data!
                      .cartItems!
                      .isEmpty)
                    CustomeButton(
                        text: ('COMPLETE YOUR ORDER'),
                        function: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ChechOut(
                                  total: CartCubit.of(context)
                                      .addCartModel!
                                      .data!
                                      .total!
                                      .toDouble(),
                                ),
                              ));
                        }),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'CALL TO ORDER',
                        style: TextStyle(
                            color: defultcolor, fontWeight: FontWeight.w900),
                      ),
                    ),
                  )
                ],
              ));
  }
}
