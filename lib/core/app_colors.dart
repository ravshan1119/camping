import 'package:flutter/material.dart';

class AppColors {
  ///base color
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFF3F3F3F);

  ///background color
  static const Color scaffoldColor = Color(0xFFFFFFFF);

  ///primary color
  static const Color green_50 = Color(0xFFF7FEE7);
  static const Color green_100 = Color(0xFFECFCCB);
  static const Color green_200 = Color(0xFFD9F99D);
  static const Color green_300 = Color(0xFFBEF264);
  static const Color green_400 = Color(0xFFA3E635);
  static const Color green_500 = Color(0xFF84CC16);
  static const Color green_600 = Color(0xFF65A30D);
  static const Color green_700 = Color(0xFF4D7C0F);
  static const Color green_800 = Color(0xFF3F6212);
  static const Color green_900 = Color(0xFF365314);

  static const Color grey_50 = Color(0xFFFAFAFA);
  static const Color grey_100 = Color(0xFFF4F4F5);
  static const Color grey_200 = Color(0xFFE4E4E7);
  static const Color grey_300 = Color(0xFFD4D4D8);
  static const Color grey_400 = Color(0xFFA1A1AA);
  static const Color grey_500 = Color(0xFF71717A);
  static const Color grey_600 = Color(0xFF52525B);
  static const Color grey_700 = Color(0xFF3F3F46);
  static const Color grey_800 = Color(0xFF27272A);
  static const Color grey_900 = Color(0xFF18181B);

  static const Color success = Color(0xFF64BC26);

  static const Color warning = Color(0xFFEA1601);

  static const Color info = Color(0xFFFAD202);
}

const MaterialColor primaryColor = MaterialColor(
  _bluePrimaryValue,
  <int, Color>{
    50: Color.fromRGBO(65, 110, 177, .1),
    100: Color.fromRGBO(65, 110, 177, .2),
    200: Color.fromRGBO(65, 110, 177, .3),
    300: Color.fromRGBO(65, 110, 177, .4),
    400: Color.fromRGBO(65, 110, 177, .5),
    500: Color.fromRGBO(65, 110, 177, .6),
    600: Color.fromRGBO(65, 110, 177, .7),
    700: Color.fromRGBO(65, 110, 177, .8),
    800: Color.fromRGBO(65, 110, 177, .9),
    900: Color.fromRGBO(65, 110, 177, 1),
  },
);
const int _bluePrimaryValue = 0xFF416EB1;

