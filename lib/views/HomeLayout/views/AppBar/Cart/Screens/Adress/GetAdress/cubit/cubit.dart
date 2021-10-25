import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop/Core/Cache/cache_helper.dart';
import 'package:shop/Core/Dio/end_pointer.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Screens/Adress/GetAdress/cubit/states.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Screens/Adress/GetAdress/model/get_model.dart';

class GetAdressCubit extends Cubit<GetAdressStates> {
  GetAdressCubit(this.isSelectable) : super(GetAddressInitial());

  final token = CacheHelper.getData(key: 'token');
  static GetAdressCubit of(context) => BlocProvider.of(context);
  final bool isSelectable;

  GetAddressModel? getAddressModel;

  Future<void> getAddress() async {
    emit(GetAddressLoading());
    try {
      final response = await Dio().get(
        baseURL + 'addresses',
        options: Options(headers: {
          'Authorization': token,
        }),
      );
      getAddressModel = GetAddressModel.fromJson(response.data);
      print(response.data);
    } catch (e) {
      print(e);
    }
    emit(GetAddressInitial());
  }

  Future<void> removeFromCards(int cardId) async {
    getAddressModel!.data!.address!
        .removeWhere((element) => element.id == cardId);
    emit(GetAddressInitial());
    final response = await Dio().delete(
      baseURL + 'addresses/$cardId',
      options: Options(headers: {
        'Authorization': token,
      }),
    );
    print(response.data);
    emit(GetAddressInitial());
    Fluttertoast.showToast(
        msg: 'Deleted Successfully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 20.0);
  }
}
