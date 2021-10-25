import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Screens/Adress/GetAdress/model/get_model.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/Screens/CheckOut/Cubit/states.dart';

class CheckOutCubit extends Cubit<CheckOutStates> {
  CheckOutCubit() : super(CheckOutInit());

  static CheckOutCubit of(context) => BlocProvider.of(context);
  Address? address;

  void selectedAddress(Address value) {
    address = value;
    emit(CheckOutInit());
  }
}
