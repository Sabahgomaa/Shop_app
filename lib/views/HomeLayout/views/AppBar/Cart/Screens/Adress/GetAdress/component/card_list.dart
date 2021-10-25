import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Screens/Adress/GetAdress/component/adress_card.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Screens/Adress/GetAdress/cubit/cubit.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Screens/Adress/GetAdress/cubit/states.dart';

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<GetAdressCubit, GetAdressStates>(
        builder: (context, state) => state is GetAddressLoading
            ? GetAdressCubit.of(context).getAddressModel == null
                ? Text('No Result')
                : Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: GetAdressCubit.of(context).getAddress,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final cubit = GetAdressCubit.of(context)
                        .getAddressModel!
                        .data!
                        .address![index];
                    return AdressCard(
                      address: cubit,
                      isSelectable: GetAdressCubit.of(context).isSelectable,
                    );
                  },
                  itemCount: GetAdressCubit.of(context)
                      .getAddressModel!
                      .data!
                      .address!
                      .length,
                ),
              ),
      ),
    );
  }
}
