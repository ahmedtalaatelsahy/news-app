import 'package:flutter/material.dart';
import 'package:news_app/style/app_style.dart';
import 'package:news_app/ui/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Elsahy news',
      theme: AppStyle.lightTheme,
      themeMode:ThemeMode.light,
      routes:{
        HomeScreen.routeName:(_)=> HomeScreen(),
      },
      initialRoute:HomeScreen.routeName ,
    );
  }
}
