import 'package:flutter/material.dart';
import 'package:puzzle_8/routing/router.dart';
import 'package:puzzle_8/routing/routes.dart';
import 'constants/globals.dart' as globals;

import 'layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Puzzle-8',
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
        }),
        primaryColor: Colors.orange,
      ),
      builder: (context, child) => SiteLayout(
        child: child!,
      ),
      initialRoute: newGameRoute,
      onGenerateRoute: generateRoute,
      navigatorKey: globals.navigator.navigationKey,
    );
  }
}