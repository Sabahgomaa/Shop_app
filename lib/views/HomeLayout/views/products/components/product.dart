import 'package:flutter/material.dart';
import 'package:shop/const/color.dart';
import 'package:shop/views/HomeLayout/Cubit/cubit.dart';

// ignore: must_be_immutable
class ProductSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = HomeLayoutCubit.of(context).homeModel!.data!.products;
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          productId: product.id,
          name: product.name,
          isFavourite: product.inFavorites!,
          image: product.image,
          discount: product.discount,
          oldPrice: product.oldPrice + 0.0,
          price: product.price + 0.0,
        );
      },
    );
    // return Column(
    //   children: [
    //     Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: [
    //           Text('Product',style:TextStyle(fontWeight: FontWeight.bold) )
    //         ],
    //       ),
    //     ),
    //     GridView.builder(
    //         gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: 2,
    //           crossAxisSpacing: 5,
    //           mainAxisSpacing: 5,
    //           mainAxisExtent: 200,
    //         ),
    //         shrinkWrap: true,
    //         itemBuilder:(BuildContext cxt,index) {
    //           return Container(
    //             alignment: Alignment.center,
    //             child: Text(''),
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(0),
    //             ),
    //           );
    //         }
    //     )
    //   ],
    // );
  }
}

class ProductCard extends StatefulWidget {
  const ProductCard(
      {Key? key,
      this.image,
      this.name,
      this.price,
      this.discount,
      this.oldPrice,
      this.isFavourite = false,
      this.productId})
      : super(key: key);
  final String? image;
  final String? name;
  final double? price;
  final int? discount;
  final int? productId;
  final double? oldPrice;
  final bool isFavourite;

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late bool isFavourite;

  @override
  void initState() {
    isFavourite = widget.isFavourite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage(widget.image!),
                width: double.infinity,
                height: 200.0,
              ),
              if (widget.discount != 0)
                Container(
                  color: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    'DISCOUNT',
                    style: TextStyle(
                      fontSize: 8.0,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.0,
                    height: 1.3,
                  ),
                ),
                Row(children: [
                  Text(
                    '${widget.price!.round()}',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: defultcolor,
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  if (widget.discount != 0)
                    Text(
                      '${widget.oldPrice!.round()}',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isFavourite = !isFavourite;
                        // TODO: Send Api Request
                      });
                      HomeLayoutCubit().changeFavority(widget.productId);
                    },
                    icon: Icon(
                      isFavourite
                          ? Icons.favorite_outlined
                          : Icons.favorite_border,
                      size: 14.0,
                    ),
                  )
                ])
              ],
            ),
          )
        ]));
  }
}
