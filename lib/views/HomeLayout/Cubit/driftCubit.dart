//   int currentIndex = 0;
//   final List<List<dynamic>> screens = [
//     [Icons.home, ProductScreen()],
//     [Icons.category, Categoryscreen()],
//     [Icons.favorite, FavoriteScreen()],
//     // [Icons.settings, SttingScreen()],
//   ];
//
//   void changeIndex(int value) {
//     if (currentIndex == value) return;
//     currentIndex = value;
//     emit(HomeLayoutInit());
//   }
//
//   Widget get getCurrentView => screens[currentIndex][1];
// }

// HomeModel? homeModel;
// void getHomeData() async {
//   emit(HomeLayoutLoadingState());
//   DioHelper.getData(
//     url: HOME,
//     token: token,
//   ).then((value) {
//     homeModel = HomeModel.fromJson(value.data);
//
//     printFullText(homeModel!.data!.banners[0].image!);
//     print(homeModel!.status);
//
//     emit(HomeLayoutSuccessState());
//   }).catchError((error) {
//     print(error.toString());
//     emit(HomeLayoutErrorState());
//   });
// }

// CategoriesModel? categoriesModel;
//
// void getCategories() {
//   DioHelper.getData(
//     url: CATEGORIES,
//   ).then((value) {
//     categoriesModel = CategoriesModel.fromJson(value.data);
//
//     emit(ShopSuccessCategoriesState());
//   }).catchError((error) {
//     print(error.toString());
//     emit(ShopErrorCategoriesState());
//   });
// }
