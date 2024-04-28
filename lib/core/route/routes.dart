import 'package:camping/screens/onboarding/onboarding_page.dart';
import 'package:camping/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'routes_const.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
        RouteList.splash: (context) => const SplashPage(),
        RouteList.onboarding: (context) => const OnboardingPage(),
      };
}
