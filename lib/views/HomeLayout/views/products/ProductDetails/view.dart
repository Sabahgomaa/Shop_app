import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/views/HomeLayout/views/products/ProductDetails/Componot/add_to_cart.dart';
import 'package:shop/views/HomeLayout/views/products/ProductDetails/Componot/product_details.dart';
import 'package:shop/views/HomeLayout/views/products/ProductDetails/Cubit/cubit.dart';
import 'package:shop/views/HomeLayout/views/products/ProductDetails/Cubit/states.dart';

class ProductDetialsView extends StatelessWidget {
  final int id;

  ProductDetialsView(this.id);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsCubit()..getProduct(this.id),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Details',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: BlocBuilder<ProductDetailsCubit, ProductDetailsStates>(
    builder: (context, state) => state is ProductDetailsLoading?Center(child: CircularProgressIndicator(),):Column(children: [
      Expanded(child: ListView(
    children: [
      ProductDetails(
    price: ProductDetailsCubit.of(context).productDetailsModel!.data!.price,
    image: ProductDetailsCubit.of(context).productDetailsModel!.data!.image,
    name: ProductDetailsCubit.of(context).productDetailsModel!.data!.name,
    id: ProductDetailsCubit.of(context).productDetailsModel!.data!.id,
    description:ProductDetailsCubit.of(context).productDetailsModel!.data!.description,
    isFavorite: ProductDetailsCubit.of(context).productDetailsModel!.data!.inFavorites,
    )
    ],
    )),
    Divider(),
    AddToCart(id: ProductDetailsCubit.of(context).productDetailsModel!.data!.id)
    ],)
      ,
      ),
    ));
  }
}
