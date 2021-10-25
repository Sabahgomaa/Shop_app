import 'package:flutter/material.dart';
import 'package:shop/const/color.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Cubit/cubit.dart';

class CartItems extends StatefulWidget {
  final String? image;
  final String? price;
  final bool? isFavourite;
  final String? name;
  final bool? isDiscount;
  final String? oldPrice;
  final int? productId;
  final int? cartId;
  final int? index;
  final int? quantity;
  final CartCubit? cubit;

  const CartItems(
      {required this.image,
      this.price,
      this.isFavourite,
      required this.name,
      this.isDiscount,
      this.oldPrice,
      this.productId,
      this.quantity = 1,
      required this.cartId,
      this.cubit,
      this.index});
  @override
  _CartItemsState createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  bool? isFavourite;
  int count = 1;
  @override
  void initState() {
    // TODO: implement initState
    isFavourite = widget.isFavourite;
    count = widget.quantity!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Image.network(
              widget.image!,
              width: 60,
            ),
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Column(children: [
                      Text(
                        widget.name!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(children: [
                            Text(
                              'Egp',
                              style:
                                  TextStyle(color: defultcolor, fontSize: 16),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              widget.price.toString(),
                              style: TextStyle(
                                color: defultcolor,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            if (widget.isDiscount != null)
                              Text(
                                widget.oldPrice.toString(),
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                    fontSize: 16),
                              )
                          ]))
                    ])))
          ]),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              widget.isFavourite != null
                  ? IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: defultcolor,
                      ),
                      onPressed: () {
                        // FavoriteController.of(context)
                        //     .changeFavorite(widget.productId);
                        // print(widget.productId);
                        // setState(() {
                        //   isFavourite = !isFavourite;
                        // });
                      },
                    )
                  : Icon(Icons.favorite_outline),
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: defultcolor,
                ),
                onPressed: () async {
                  widget.cubit!.removeFromCart(widget.cartId!);
                },
              ),
              IconButton(
                  onPressed: (count > 1)
                      ? () {
                          setState(() {
                            count--;
                          });
                          widget.cubit!.updateCart(count, widget.cartId!);
                        }
                      : null,
                  icon: CircleAvatar(
                    maxRadius: 13,
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 15,
                    ),
                    backgroundColor: (count > 1) ? defultcolor : Colors.grey,
                  )),
              Text(
                '$count',
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      count++;
                    });
                    widget.cubit!.updateCart(count, widget.cartId!);
                  },
                  icon: CircleAvatar(
                    maxRadius: 13,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 15,
                    ),
                    backgroundColor: defultcolor,
                  )),
            ],
          )
        ]));
  }
}
