

import 'dart:ui';

class CategoryModel{
  String id;
  String title;
  String imagePath;
  Color backGround;
  CategoryModel({required this.id,required this.title,required this.imagePath,required this.backGround});
  static List<CategoryModel> categories=[
    CategoryModel(id: "sports",title: "Sports", imagePath: "assets/images/sports.png", backGround: Color(0xffC91C22)),
    CategoryModel(id: "politics",title: "Politics", imagePath: "assets/images/Politics.png", backGround: Color(0xff003E90)),
    CategoryModel(id: "health",title: "Health", imagePath: "assets/images/health.png", backGround: Color(0xffED1E79)),
    CategoryModel(id: "business",title: "Business", imagePath: "assets/images/bussines.png", backGround: Color(0xffCF7E48)),
    CategoryModel(id: "environment",title: "Environment", imagePath: "assets/images/environment.png", backGround: Color(0xff4882CF)),
    CategoryModel(id: "science",title: "Science", imagePath: "assets/images/science.png", backGround: Color(0xffF2D352)),
  ];
}