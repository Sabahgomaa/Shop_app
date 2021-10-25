import 'package:flutter/material.dart';
import 'package:shop/const/color.dart';

// ignore: must_be_immutable
class Navigatinbar extends StatelessWidget {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: defultcolor,
        onTap: (index) {
          currentIndex = index;
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              label: 'Category'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: 'Favorite'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: 'Setting'),
        ],
      ),
    );
  }
}
