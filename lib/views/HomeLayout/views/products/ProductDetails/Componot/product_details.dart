import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/const/color.dart';
import 'package:shop/views/HomeLayout/views/products/ProductDetails/Cubit/cubit.dart';
import 'package:shop/views/HomeLayout/views/products/ProductDetails/Cubit/states.dart';

class ProductDetails extends StatefulWidget {
  final String? image;
  final String? name;
  final int? price;
  final int? id;
  final String? description;
  final bool? isFavorite;
  const ProductDetails(
      {this.image,
      this.id,
      this.name,
      this.price,
      this.description,
      this.isFavorite});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    print(widget.image);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<ProductDetailsCubit, ProductDetailsStates>(
          builder: (context, state) => state is ProductDetailsLoading
              ? CircularProgressIndicator()
              : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Stack(alignment: AlignmentDirectional.bottomStart, children: [
                    Container(
                      child: Text(
                        'Discount',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                    Image.network(widget.image.toString()),
                  ]),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      widget.name.toString(),
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: [
                        Text(
                          'Price: ',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          child: Text(
                            widget.price.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          decoration: BoxDecoration(color: defultcolor),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: widget.isFavorite != false
                                ? Icon(
                                    Icons.favorite,
                                    color: defultcolor,
                                  )
                                : Icon(
                                    Icons.favorite_outline,
                                    color: Colors.grey,
                                  ))
                      ],
                    ),
                  ),
                  Text(
                    'Discription: ',
                    style: TextStyle(fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      ProductDetailsCubit.of(context)
                          .productDetailsModel!
                          .data!
                          .description
                          .toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ])),
    );
  }
}
