import 'package:camping/core/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  primarySwatch: primaryColor,
  useMaterial3: false,
  scaffoldBackgroundColor: AppColors.scaffoldColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.scaffoldColor,
  ),
).copyWith(
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
  }),
);
