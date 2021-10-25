import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shop/const/color.dart';

class Rating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: defultcolor,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
          itemCount: 5,
          itemSize: 20,
          initialRating: 3,
          minRating: .5,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemPadding: EdgeInsets.symmetric(horizontal: 1),
        ),
        SizedBox(
          width: 130,
        ),
        Icon(
          Icons.share,
          color: defultcolor,
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.favorite_border,
          color: defultcolor,
        )
      ],
    );
  }
}
