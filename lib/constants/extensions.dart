import 'package:flutter/material.dart';

extension SimpleNavigator on BuildContext {
  navigateTo(Widget screen) {
    return Navigator.of(this).push(MaterialPageRoute(builder: (context) {
      return screen;
    }));
  }
}
