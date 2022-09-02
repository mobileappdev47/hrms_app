

import 'package:flutter/material.dart';
import 'package:hrms_app/utils/helper.dart';


class NavigatorService {
  static void pop() {
    navigatorKey.currentState!.pop();
  }

  static void pushScreen(Widget screen,{VoidCallback? whenComplete}) {
    navigatorKey.currentState!.push(MaterialPageRoute(
      builder: (context) => screen,
    )).whenComplete(() => whenComplete == null ? null : whenComplete());
  }
  static void pushAndRemoveuntil(Widget screen ){
    navigatorKey.currentState!.pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> screen), (route) => false);
  } 
//  navigator.currentState.pushand(MaterialPageRoute(
//       builder: (context) => screen,
}
