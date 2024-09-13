import 'package:flutter/material.dart';

import 'drawer_item.dart';
typedef onTabClick=void Function(MenuTab);
class CustomDrawer extends StatelessWidget {
  onTabClick onTab;
   CustomDrawer({super.key,required this.onTab});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 50),
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.primary),
            child: Text(
              "News App!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          SizedBox(height: 29,),
          DrawerItem(image: "assets/images/Icon awesome-th-list.svg", title: "Categories",onPress: () {
            onTab(MenuTab.categories);
          },),
          DrawerItem(image: "assets/images/Icon ionic-md-settings.svg", title: "Settings",onPress: () {
onTab(MenuTab.settings);
          },),
        ],
      ),
    );
  }
}

enum MenuTab{
  categories,
  settings

}
