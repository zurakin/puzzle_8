import 'package:flutter/material.dart';
import 'package:puzzle_8/constants/style.dart';
import 'package:puzzle_8/routing/routes.dart';
import 'package:puzzle_8/constants/globals.dart' as globals;
import 'drawerMenuItem.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = drawerItems
        .map((item) => DrawerMenuItem(
            itemName: getRouteName(item),
            icon: getIconForRoute(item),
            onTap: () {
              globals.navigator.navigateTo(item);
            }))
        .toList();
    return Drawer(
      backgroundColor: primaryColor,
      child: ListView(
        children: widgets,
      ),
    );
  }

  getIconForRoute(String item) {
    switch (item) {
      case aboutPageRoute:
        return const Icon(
          Icons.help_outline,
          color: drawerIconColor,
        );
      case newGameRoute:
        return const Icon(
          Icons.videogame_asset,
          color: drawerIconColor,
        );
      default:
        return const Icon(Icons.turned_in, color: Colors.white);
    }
  }
}

List<String> drawerItems = [
  newGameRoute,
  aboutPageRoute,
];
