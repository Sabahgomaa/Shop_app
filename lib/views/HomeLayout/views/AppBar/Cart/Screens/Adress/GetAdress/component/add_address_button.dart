import 'package:flutter/material.dart';
import 'package:shop/const/color.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Screens/Adress/GetAdress/View.dart';

class AddAddressButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey),
        ),
        height: 50,
        child: InkWell(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GetAddressView(),
                  ),
                ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircleAvatar(
                radius: 10,
                child: Icon(
                  Icons.add,
                  size: 15,
                  color: Colors.white,
                ),
                backgroundColor: defultcolor,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                'ADD NEW ADDRESS',
                style:
                    TextStyle(fontWeight: FontWeight.w700, color: defultcolor),
              )
            ])));
  }
}
