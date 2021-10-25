import 'package:flutter/material.dart';

class AdressDetials extends StatelessWidget {
  final String title;

  AdressDetials(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.grey[600],
      ),
    );
  }
}
