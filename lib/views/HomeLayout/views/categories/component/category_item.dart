import 'package:flutter/material.dart';
import 'package:shop/views/HomeLayout/model/category_model.dart';

// ignore: must_be_immutable
class CatogtyItem extends StatelessWidget {
  DataModel? catoryModel;
  CatogtyItem(this.catoryModel);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          image: NetworkImage(catoryModel!.image!),
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: 20.0,
        ),
        Text(
          catoryModel!.name!,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        Icon(Icons.arrow_forward_ios)
      ],
    );
  }
}
