import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Core/Cache/cache_helper.dart';
import 'package:shop/Core/Dio/end_pointer.dart';
import 'package:shop/const/color.dart';
import 'package:shop/views/HomeLayout/Cubit/states.dart';
import 'package:shop/views/HomeLayout/model/category_model.dart';
import 'package:shop/views/HomeLayout/model/change_favorities_model.dart';
import 'package:shop/views/HomeLayout/model/favorites_model.dart';
import 'package:shop/views/HomeLayout/model/home_model.dart';
import 'package:shop/views/HomeLayout/model/notification_model.dart';
import 'package:shop/views/HomeLayout/views/Favorites/view.dart';
import 'package:shop/views/HomeLayout/views/Notifcation/view.dart';
import 'package:shop/views/HomeLayout/views/categories/view.dart';
import 'package:shop/views/HomeLayout/views/products/view.dart';
import 'package:shop/views/HomeLayout/views/setting/view.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(HomeLayoutInit());

  static HomeLayoutCubit of(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> bottomScreens = [
    ProductScreen(),
    CategoryScreen(),
    FavorityScreen(),
    NotificationScreen(),
    SettingScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;

    emit(HomeLayoutBottomNavState());
  }

  HomeModel? homeModel;

  void getHomeData() async {
    emit(HomeLayoutLoadingState());

    try {
      final token = CacheHelper.getData(key: 'token');
      final res = await Dio().get(baseURL + HOME,
          options: Options(headers: {
            'Authorization': token,
          }));
      print(res.data);

      homeModel = HomeModel.fromJson(res.data);
      // printFullText(homeModel!.data!.banners[0].image!);
      // print(homeModel!.status);
      emit(HomeLayoutSuccessState(homeModel!));
    } catch (e, s) {
      print(e);
      print('=' * 8);
      print(s);
      emit(HomeLayoutErrorState(e.toString()));
    }
  }

  CategoriesModel? categoriesModel;
  void getCategories() async {
    final token = CacheHelper.getData(key: 'token');
    try {
      final res = await Dio().get(baseURL + CATEGORIES,
          options: Options(headers: {
            'Authorization': token,
          }));
      print(res.data);
      categoriesModel = CategoriesModel.fromJson(res.data);
      // emit(ShopSuccessCategoriesState());
    } catch (e, s) {
      print(e);
      print('*' * 8);
      print(s);
      // emit(HomeLayoutErrorState(e.toString()));
    }
  }

  ChangeFavoritesModel? changeFavoritesModel;
  Map<int, bool>? favorites = {};

  void changeFavority(int? id) async {
    printFullText('text');
    final token = CacheHelper.getData(key: 'token');
    final res = await Dio().post(baseURL + FAVORITE,
        data: {'product_id': id},
        options: Options(headers: {'Authorization': token}));
    changeFavoritesModel = ChangeFavoritesModel.fromJson(res.data);
    print(res.data);
    printFullText(res.data.toString());
    getFavorites();
  }

  FavoritesModel? favoritesModel;
  void getFavorites() async {
    final token = CacheHelper.getData(key: 'token');
    try {
      final res = await Dio().get(baseURL + FAVORITE,
          options: Options(headers: {
            'Authorization': token,
            'Content-Type': 'application/json',
            'lang': 'ar'
          }));
      print(res.data);
      favoritesModel = FavoritesModel.fromJson(res.data);
    } catch (e, s) {
      print(e);
      print('*' * 8);
      print(s);
    }
  }

  NotificationModel? notificationModel;
  void getNotification() async {
    final token = CacheHelper.getData(key: 'token');
    try {
      final res = await Dio().get(baseURL + NOTIFICATIONS,
          options: Options(headers: {
            'Authorization': token,
          }));
      print(res.data);
      notificationModel = NotificationModel.fromJson(res.data);
    } catch (e, s) {
      print(e);
      print('*' * 8);
      print(s);
    }
  }
}
