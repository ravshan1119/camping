import 'package:camping/screens/add_trip/add_trip_page.dart';
import 'package:camping/screens/add_trip/pages/add_trip_locations_page/add_trip_locations_page.dart';
import 'package:camping/screens/add_trip/pages/add_trip_start_page/add_trip_start_page.dart';
import 'package:camping/screens/auth/auth_page.dart';
import 'package:camping/screens/auth/login/login_page.dart';
import 'package:camping/screens/auth/register/register_page.dart';
import 'package:camping/screens/how_to_use/how_to_use_page.dart';
import 'package:camping/screens/language/language_page.dart';
import 'package:camping/screens/log_out/log_out_page.dart';
import 'package:camping/screens/notifications/notifications_page.dart';
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
        RouteList.notifications: (context) => const NotificationsPage(),
        RouteList.howToUse: (context) => const HowToUsePage(),
        RouteList.logOut: (context) => const LogOutPage(),
        RouteList.language: (context) => const LanguagePage(),
        RouteList.addTripStart: (context) => const AddTripStartPage(),
        RouteList.addTripLocation: (context) => const AddTripLocationsPage(),
      };
}
