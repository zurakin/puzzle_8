import 'package:flutter/material.dart';
import 'package:puzzle_8/constants/style.dart';
import 'package:puzzle_8/routing/routes.dart';

import 'drawerMenuItem.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = drawerItems
        .map((item) => DrawerMenuItem(
        itemName: item,
        onTap: () {
        }))
        .toList();
    return Drawer(
      backgroundColor: primaryColor,
      child: ListView(
        children: widgets,
      ),
    );
  }
}


List<String> drawerItems = [
  getRouteName(mainMenuRoute),
  getRouteName(newGameRoute),
];