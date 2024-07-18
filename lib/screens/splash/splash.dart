import 'dart:async';

import 'package:camping/core/app_colors.dart';
import 'package:camping/core/app_icons.dart';
import 'package:camping/core/extension.dart';
import 'package:camping/core/route/routes_const.dart';
import 'package:camping/data/injection.dart';
import 'package:camping/data/local_storage.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _nextPage() {
    Timer(const Duration(seconds: 2), () {
      String token = getIt<LocalStorage>().getToken();

      if (token.isEmpty) {
        Navigator.of(context).pushReplacementNamed(RouteList.onboarding);
      } else {
        Navigator.of(context).pushReplacementNamed(RouteList.addTrip);
      }
    });
  }

  @override
  void initState() {
    _nextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green_500,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Image.asset(AppIcons.logo),
            ),
            8.h,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Makes your camping more easy, next level. and helps you to follow your plannings.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
