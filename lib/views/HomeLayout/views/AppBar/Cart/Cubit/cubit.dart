import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop/Core/Cache/cache_helper.dart';
import 'package:shop/Core/Dio/end_pointer.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Cubit/states.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Model/add_cart.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Model/cart_model.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitial());
  final token = CacheHelper.getData(key: 'token');
  static CartCubit of(context) => BlocProvider.of(context);
  CartModel? cartModel;
  Future<void> addCart(int idProduct) async {
    emit(CartLoading());
    try {
      final res = await Dio().post(
        baseURL + CARTS,
        data: {'product_id': idProduct},
        options: Options(headers: {
          'Authorization': token,
        }),
      );
      cartModel = CartModel.fromJson(res.data);
      print(res.data);
    } catch (e, s) {
      print(e);
      print(s);
    }
    emit(CartInitial());
  }

  AddCartModel? addCartModel;
  Future<void> getCart() async {
    emit(CartViewLoading());
    try {
      final res = await Dio().get(
        baseURL + CARTS,
        options: Options(headers: {
          'Authorization': token,
        }),
      );
      addCartModel = AddCartModel.fromJson(res.data);
    } catch (e, s) {
      print(e);
      print(s);
    }
    emit(CartViewInitial());
  }

  Future<void> updateCart(int quantity, int cartId) async {
    try {
      final res = await Dio().put(
        baseURL + 'carts/$cartId',
        data: {'quantity': quantity},
        options: Options(headers: {
          'Authorization': token,
        }),
      );
      addCartModel!.data!.total = res.data!['data']['total'];
    } catch (e, s) {
      print(e);
      print(s);
    }
    emit(CartViewInitial());
  }

  Future<void> removeFromCart(int cartId) async {
    addCartModel!.data!.cartItems!
        .removeWhere((element) => element.id == cartId);
    emit(CartViewInitial());
    final res = await Dio().delete(
      baseURL + 'carts/$cartId',
      options: Options(headers: {
        'Authorization': token,
      }),
    );
    addCartModel!.data!.total = res.data['data']['total'];
    emit(CartViewInitial());
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
