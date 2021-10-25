import 'package:flutter/material.dart';
import 'package:shop/views/HomeLayout/Cubit/cubit.dart';

// ignore: must_be_immutable
class CategorySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoriesModel = HomeLayoutCubit.of(context).categoriesModel!;
    return SizedBox(
      height: MediaQuery.of(context).size.height / 5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        // physics: NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        itemCount: categoriesModel.data!.data!.length,
        itemBuilder: (context, index) {
          final category = categoriesModel.data!.data![index];
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
              Image(
                image: NetworkImage(category.image!),
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.black.withOpacity(.8),
                width: 100,
                child: Text(
                  category.name!,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white),
                ),
              )
            ]),
          );
        },
      ),
    );
  }
}
