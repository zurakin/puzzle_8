import 'package:flutter/material.dart';

class Navigator {
  final GlobalKey<NavigatorState> navigationKey = GlobalKey();


  Navigator();

  Future<dynamic>? navigateTo(String routeName, [var args]){
    return navigationKey.currentState?.pushNamed(routeName, arguments: args);
  }

  void goBack() {
    return navigationKey.currentState?.pop();
  }
}