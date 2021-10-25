import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/const/color.dart';
import 'package:shop/views/HomeLayout/Cubit/cubit.dart';
import 'package:shop/views/HomeLayout/Cubit/states.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Cart/View.dart';
import 'package:shop/views/HomeLayout/views/AppBar/Search/View.dart';
import 'package:shop/widget/nav_to.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        // BlocProvider(
        //   create: (context) => HomeLayoutCubit(),
        //   child:
        BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeLayoutCubit.of(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: defultcolor,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                ),
                onPressed: () {
                  navigateTo(
                    context,
                    SearchScreen(),
                  );
                },
              ),
            ],
            leading: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                navigateTo(
                  context,
                  CartView(),
                );
              },
            ),
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.changeBottom(index);
            },
            currentIndex: cubit.currentIndex,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: defultcolor,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'Category'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications), label: 'Notification'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Setting')
            ],
          ),
        );
      },
    );
  }
}
