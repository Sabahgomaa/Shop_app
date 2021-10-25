import 'package:flutter/material.dart';
import 'package:shop/const/color.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Screens/Adress/GetAdress/component/adress_text_font.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Screens/Adress/GetAdress/cubit/cubit.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Screens/Adress/GetAdress/model/get_model.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Screens/Adress/UpdateAdress/view.dart';

// ignore: must_be_immutable
class AdressCard extends StatelessWidget {
  Address? address;
  bool? isSelectable;
  bool? isEditable;
  AdressCard({this.address, this.isSelectable, this.isEditable});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: Colors.grey)),
            height: MediaQuery.of(context).size.height / 3.3,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: address == null
                    ? TextButton(
                        onPressed: () {}, child: Text('Choose Address'))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                if (isEditable = true)
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  UpdateAddressView(
                                                      address: address),
                                            ));
                                      },
                                      child: Text(
                                        'Edit',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: defultcolor,
                                            fontSize: 20),
                                      )),
                                IconButton(
                                    onPressed: () {
                                      if (isEditable = true) {
                                        GetAdressCubit.of(context)
                                            .removeFromCards(address!.id);
                                      } else {}
                                    },
                                    icon: Icon(
                                      Icons.cancel,
                                      color: defultcolor,
                                      size: 25,
                                    ))
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  address!.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                AdressDetials(address!.city),
                                AdressDetials(address!.region),
                                AdressDetials(address!.details),
                              ],
                            ),
                            Divider(
                              thickness: 1.5,
                            ),
                            if (isSelectable = true)
                              Center(
                                child: TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, address),
                                  child: Text(
                                    'SELECT THIS ADDRESS',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: defultcolor),
                                  ),
                                ),
                              ),
                          ]))));
  }
}
