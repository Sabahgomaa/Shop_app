import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Core/Cache/cache_helper.dart';
import 'package:shop/Core/Dio/end_pointer.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Screens/Adress/GetAdress/cubit/states.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Screens/Adress/GetAdress/model/get_model.dart';

class EditAdressCubit extends Cubit<GetAdressStates> {
  static EditAdressCubit of(context) => BlocProvider.of(context);

  final Address address;
  EditAdressCubit(this.address) : super(GetAddressInitial()) {
    name = TextEditingController(text: address.name);
    city = TextEditingController(text: address.city);
    region = TextEditingController(text: address.region);
    details = TextEditingController(text: address.details);
    notes = TextEditingController(text: address.notes);
  }
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? region;
  TextEditingController? details;
  TextEditingController? notes;
  final fromKey = GlobalKey<FormState>();
  final token = CacheHelper.getData(key: 'token');
  Future<void> upDate(int cardId) async {
    emit(GetAddressLoading());
    final fromDate = {
      "name": name!.text,
      "city": city!.text,
      "region": region!.text,
      "details": details!.text,
      "notes": notes!.text,
      'latitude': 0,
      'longitude': 0,
    };
    try {
      final response = await Dio().put(
        baseURL + 'addresses/$cardId',
        data: fromDate,
        options: Options(headers: {
          'Authorization': token,
        }),
      );
      print(response.data);
    } catch (e) {
      print(e);
    }
    emit(GetAddressInitial());
  }
}
