import 'package:flutter/material.dart';
import 'package:puzzle_8/constants/style.dart';
import 'package:puzzle_8/widgets/drawer.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final Widget child;

  SiteLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Puzzle-8"),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
          ),
          onPressed: () {scaffoldKey.currentState!.openDrawer();},
        ),
      ),
      drawer: MenuDrawer(),
      body: child,
    );
  }
}
