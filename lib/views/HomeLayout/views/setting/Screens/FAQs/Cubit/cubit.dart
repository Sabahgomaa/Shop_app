import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Core/Dio/end_pointer.dart';
import 'package:shop/views/HomeLayout/views/setting/Screens/FAQs/Cubit/states.dart';
import 'package:shop/views/HomeLayout/views/setting/Screens/FAQs/Model/model_FAQs.dart';

class FAQsCubit extends Cubit<FAQsStates> {
  FAQsCubit() : super(FAQsInitial());
  static FAQsCubit of(context) => BlocProvider.of(context);
  FAQsModel? faQsModel;

  void getFAQs() async {
    emit(FQAsLoading());
    try {
      final res = await Dio().get(baseURL + FAQs);
      faQsModel = FAQsModel.fromJson(res.data);
      emit(FQAsSucess());
    } catch (e, s) {
      print(e);
      print(s);
    }
  }
}
