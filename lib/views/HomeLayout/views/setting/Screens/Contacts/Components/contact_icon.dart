import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/const/color.dart';
import 'package:shop/views/HomeLayout/views/setting/Screens/Contacts/Cubit/cubit.dart';
import 'package:shop/views/HomeLayout/views/setting/Screens/Contacts/Cubit/states.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsCubit, ContactStates>(
        builder: (context, state) => Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: InkWell(
                      onTap: _launchURL,
                      child: Image.network(
                        'https://tse1.mm.bing.net/th?id=OIP.IyXyScHL0JK_GPheuXMWyQHaHa&pid=Api&P=0&w=300&h=300',
                        height: 70,
                      ),
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: defultcolor),
                  )
                ],
              ),
            ));
  }

  final _url = 'https://flutter.dev';
  Future<void> _launchURL() async {
    await canLaunch(_url)
        ? await launch(
            _url,
            forceSafariVC: false,
            forceWebView: false,
          )
        : throw 'Could not launch $_url';
  }
}
