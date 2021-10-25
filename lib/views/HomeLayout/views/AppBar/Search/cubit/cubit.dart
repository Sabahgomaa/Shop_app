import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Core/Cache/cache_helper.dart';
import 'package:shop/Core/Dio/end_pointer.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Search/cubit/states.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Search/model/model.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? model;

  Future<void> search(String text) async {
    emit(SearchLoadingState());
    final token = CacheHelper.getData(key: 'token');
    try {
      final response = await Dio().post(baseURL + SEARCH,
          options: Options(headers: {
            'Authorization': token,
          }),
          data: {"text": text});
      print(response.data);
      model = SearchModel.fromJson(response.data);
    } catch (e, s) {
      print(e);
      print(s);
    }
  }
}
