import 'package:shop/views/HomeLayout/views/AppBar/Search/model/model.dart';

abstract class SearchStates {}

class SearchInitialState extends SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchSuccessState extends SearchStates {
  SearchSuccessState(SearchModel searchModel);
}

class SearchErrorState extends SearchStates {}
