import 'package:flutter/material.dart';
import 'package:shop/const/color.dart';
import 'package:shop/views/HomeLayout/Cubit/cubit.dart';
import 'package:shop/views/HomeLayout/model/favorites_model.dart';

// ignore: must_be_immutable
class FavoritiesItem extends StatelessWidget {
  FavoritesData? favoritesmodel;
  FavoritiesItem(this.favoritesmodel);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Image(
            image: NetworkImage(favoritesmodel!.product!.image!),
            width: 120.0,
            height: 120.0,
          ),
          if (favoritesmodel!.product!.discount != 0)
            Container(
              color: Colors.red,
              padding: EdgeInsets.symmetric(
                horizontal: 5.0,
              ),
              child: Text(
                'DISCOUNT',
                style: TextStyle(fontSize: 8.0, color: Colors.white),
              ),
            ),
        ],
      ),
      SizedBox(
        width: 20.0,
      ),
      Column(children: [
        Text(
          favoritesmodel!.product!.price.toString(),
          style: TextStyle(
            fontSize: 12.0,
            color: defultcolor,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        if (favoritesmodel!.product!.discount != 0)
          Text(
            favoritesmodel!.product!.oldPrice.toString(),
            style: TextStyle(
              fontSize: 10.0,
              color: Colors.grey,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        Spacer(),
        IconButton(
            onPressed: () {
              HomeLayoutCubit.of(context).changeFavority(favoritesmodel!.id);
            },
            icon: CircleAvatar(
              radius: 15.0,
              backgroundColor:
                  HomeLayoutCubit.of(context).favorites![favoritesmodel!.id] !=
                          null
                      ? defultcolor
                      : Colors.grey,
              child: Icon(
                Icons.favorite_border,
                size: 14.0,
                color: Colors.white,
              ),
            ))
      ])
    ]);
  }
}

//             ConditionalBuilder(
// condition: HomeLayoutCubit.of(context).favorites[favoritesmodel!.product!.id!],
// builder: (context) => defultcolor ,
// fallback: ( context) =>  Colors.grey,
// )
