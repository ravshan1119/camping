import 'package:camping/screens/add_trip/add_trip_page.dart';
import 'package:camping/screens/auth/auth_page.dart';
import 'package:camping/screens/auth/login/login_page.dart';
import 'package:camping/screens/auth/register/register_page.dart';
import 'package:camping/screens/onboarding/onboarding_page.dart';
import 'package:camping/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'routes_const.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
        RouteList.splash: (context) => const SplashPage(),
        RouteList.onboarding: (context) => const OnboardingPage(),
        RouteList.login: (context) => const LoginPage(),
        RouteList.register: (context) => const RegisterPage(),
        RouteList.auth: (context) => const AuthPage(),
        RouteList.addTrip: (context) => const AddTripPage(),
      };
}
