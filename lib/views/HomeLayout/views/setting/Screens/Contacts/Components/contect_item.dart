import 'package:flutter/material.dart';
import 'package:shop/const/color.dart';
import 'package:url_launcher/url_launcher.dart';

class ContatItem extends StatelessWidget {
  final String? img;
  final Function? press;

  const ContatItem({Key? key, this.img, this.press}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        print('hi');
        const url = 'https://www.google.com/';
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw ('Could not launch $url');
        }
      },
      child: Container(
        child: Image.network(
          img!,
          height: 70,
        ),
        decoration: BoxDecoration(shape: BoxShape.circle, color: defultcolor),
      ),
    );
  }
}
