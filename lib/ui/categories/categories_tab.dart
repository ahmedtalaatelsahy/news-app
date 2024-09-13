import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/ui/categories/widgets/category_item.dart';

class CategoriesTab extends StatelessWidget {
  void Function(String) onCategoryClick;
   CategoriesTab({super.key,required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35, left: 35, right: 35),
      child: Column(
        children: [
          Text(
            "Pick your category of interest",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 25,
                  childAspectRatio: 1 / 1.1),
              itemBuilder: (context, index) => CategoryItem(onTab: (){
                onCategoryClick(CategoryModel.categories[index].id);
              },
                categoryModel: CategoryModel.categories[index],
                index: index,
              ),
              itemCount: CategoryModel.categories.length,
            ),
          )
        ],
      ),
    );
  }
}
