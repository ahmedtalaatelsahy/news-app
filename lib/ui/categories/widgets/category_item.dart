import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;
  final int index;
  final void Function() onTab;
  const CategoryItem(
      {super.key, required this.categoryModel, required this.index, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTab,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomLeft: index.isEven?Radius.circular(25):Radius.zero,
              bottomRight: index.isOdd?Radius.circular(25):Radius.zero
            ),
            color: categoryModel.backGround),
        child: Column(
          children: [
            Image.asset(
              categoryModel.imagePath,
              height: MediaQuery.of(context).size.height * 0.1,
              fit: BoxFit.fitHeight,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              categoryModel.title,
              style: TextStyle(
                  color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
