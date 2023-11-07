import 'package:flutter/material.dart';
import 'package:to_do_app_route/shared/styles/colors.dart';

class MyThemeData {

  static ThemeData lightTheme = ThemeData(

      scaffoldBackgroundColor:primary,
      bottomNavigationBarTheme:  BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        selectedItemColor: primary,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
      ));
  static ThemeData darkTheme = ThemeData();
}
