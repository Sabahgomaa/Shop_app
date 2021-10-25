import 'package:shop/views/HomeLayout/model/change_favorities_model.dart';
import 'package:shop/views/HomeLayout/model/home_model.dart';

abstract class HomeLayoutStates {}

class HomeLayoutInit extends HomeLayoutStates {}

class HomeLayoutBottomNavState extends HomeLayoutStates {}

class HomeLayoutLoadingState extends HomeLayoutStates {}

class HomeLayoutSuccessState extends HomeLayoutStates {
  HomeLayoutSuccessState(HomeModel homeModel);
}

class HomeLayoutErrorState extends HomeLayoutStates {
  HomeLayoutErrorState(String string);
}

class ShopSuccessCategoriesState extends HomeLayoutStates {}

class ShopErrorCategoriesState extends HomeLayoutStates {}

class ChangeFavoritesState extends HomeLayoutStates {}

class SuccessChangeFavoritesState extends HomeLayoutStates {
  final ChangeFavoritesModel model;

  SuccessChangeFavoritesState(this.model);
}

class ErrorChangeFavoritesState extends HomeLayoutStates {}

class LoadingGetFavoritesState extends HomeLayoutStates {}

class SuccessGetFavoritesState extends HomeLayoutStates {}

class ErrorGetFavoritesState extends HomeLayoutStates {}
