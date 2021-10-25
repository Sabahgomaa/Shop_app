import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/const/color.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Screens/Adress/GetAdress/component/adress_card.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Screens/CheckOut/Cubit/cubit.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Screens/CheckOut/Cubit/states.dart';

class ChechOut extends StatefulWidget {
  final double? total;
  const ChechOut({this.total});

  @override
  _ChechOutState createState() => _ChechOutState();
}

class _ChechOutState extends State<ChechOut> {
  int? selectedRadioTile;
  void initstate() {
    super.initState();
    selectedRadioTile = 0;
  }

  setSelectedColorRadio(val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckOutCubit(),
      child: BlocBuilder<CheckOutCubit, CheckOutStates>(
        builder: (context, state) {
          final cubit = CheckOutCubit.of(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Checkout',
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: ListView(
              children: [
                Row(
                  children: [
                    Text('Your Address'),
                    DropdownMenuItem(
                        child: Icon(Icons.keyboard_arrow_down_outlined))
                  ],
                ),
                AdressCard(
                  address: cubit.address,
                  isEditable: false,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RadioListTile(
                      value: 1,
                      groupValue: selectedRadioTile,
                      title: Text('Visa'),
                      onChanged: (val) {
                        setSelectedColorRadio(val);
                      },
                      activeColor: Colors.deepOrange,
                    ),
                    RadioListTile(
                      value: 2,
                      groupValue: selectedRadioTile,
                      title: Text('Cach'),
                      onChanged: (val) {
                        setSelectedColorRadio(val);
                      },
                      activeColor: Colors.deepOrange,
                    )
                  ],
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total: ',
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        'EGP',
                        style: TextStyle(fontSize: 25, color: defultcolor),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        widget.total.toString(),
                        style: TextStyle(fontSize: 25, color: defultcolor),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: Colors.grey)),
                  height: 70,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
