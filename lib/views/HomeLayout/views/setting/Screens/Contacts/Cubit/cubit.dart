import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Core/Dio/end_pointer.dart';
import 'package:shop/views/HomeLayout/views/setting/Screens/Contacts/Cubit/states.dart';
import 'package:shop/views/HomeLayout/views/setting/Screens/Contacts/Model/contact_model.dart';

class ContactsCubit extends Cubit<ContactStates> {
  ContactsCubit() : super(ContactInitial());
  static ContactsCubit of(context) => BlocProvider.of(context);

  Contacts? contacts;

  void getcontact() async {
    emit(ContactLoading());
    try {
      final response = await Dio().get(
        baseURL + CONTACTS,
        // options: dioOptions
      );
      contacts = Contacts.fromJson(response.data);
      print(response.data);
    } catch (e, s) {
      print(e);
      print(s);
    }
  }
}
