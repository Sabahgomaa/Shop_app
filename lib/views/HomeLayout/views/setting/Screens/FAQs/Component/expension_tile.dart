import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/views/HomeLayout/views/setting/Screens/FAQs/Cubit/cubit.dart';
import 'package:shop/views/HomeLayout/views/setting/Screens/FAQs/Cubit/states.dart';

class ExpensionTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FAQsCubit, FAQsStates>(
        builder: (context, state) => state is FQAsLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: FAQsCubit.of(context).faQsModel!.data!.data!.length,
                itemBuilder: (context, index) => ExpansionTile(
                      title: Text(FAQsCubit.of(context)
                          .faQsModel!
                          .data!
                          .data![index]
                          .question
                          .toString()),
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(FAQsCubit.of(context)
                                .faQsModel!
                                .data!
                                .data![index]
                                .answer
                                .toString()))
                      ],
                    )));
  }
}
