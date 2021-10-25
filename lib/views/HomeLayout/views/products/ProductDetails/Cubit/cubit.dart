import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Core/Cache/cache_helper.dart';
import 'package:shop/Core/Dio/end_pointer.dart';
import 'package:shop/views/HomeLayout/views/products/ProductDetails/Cubit/states.dart';
import 'package:shop/views/HomeLayout/views/products/ProductDetails/model/product_detials_model.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsStates> {
  ProductDetailsCubit() : super(ProductDetailsInitial());
  static ProductDetailsCubit of(context) => BlocProvider.of(context);

  ProductDetailsModel? productDetailsModel;

  Future<void> getProduct(int id) async {
    emit(ProductDetailsLoading());
    final token = CacheHelper.getData(key: 'token');
    try {
      final response = await Dio().get(baseURL + 'products/$id',
          options: Options(headers: {
            'Authorization': token,
          }));
      productDetailsModel = ProductDetailsModel.fromJson(response.data);
      print(productDetailsModel!.data!.image);
    } catch (e, s) {
      print(e);
      print(s);
    }
    emit(ProductDetailsInitial());
  }
}
