// ChangeFavoritesModel? changeFavoritesModel;
// Map<int, bool> favorites = {};
//
// void changeFavority(dynamic productId) {
//   favorites[productId] = !favorites[productId]!;
//
//   emit(ChangeFavoritesState());
//
//   DioHelper.postData(
//     url: FAVORITE,
//     data: {
//       'product_id': productId,
//     },
//     token: token,
//   ).then((value) {
//     changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
//     print(value.data);
//
//     if (!changeFavoritesModel!.status!) {
//       favorites[productId] = !favorites[productId]!;
//     } else {
//       getFavority();
//     }
//
//     emit(SuccessChangeFavoritesState(changeFavoritesModel!));
//   }).catchError((error) {
//     favorites[productId] = !favorites[productId]!;
//     emit(ErrorChangeFavoritesState());
//
//     DioHelper.getData(url: FAVORITE, token: token).then((value) {
//       favoritesModel = FavoritesModel.fromJson(value.data);
//       printFullText(value.data.toString());
//       emit(SuccessGetFavoritesState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(ErrorGetFavoritesState());
//     });
//   });
// }
//
// FavoritesModel? favoritesModel;
//
// void getFavority() {
//   emit(LoadingGetFavoritesState());
// }
