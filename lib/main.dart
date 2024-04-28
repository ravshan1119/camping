import 'package:camping/core/route/navigator.dart';
import 'package:camping/core/route/routes.dart';
import 'package:camping/core/route/routes_const.dart';
import 'package:camping/core/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camping',
      theme: themeData,
      navigatorKey: NavigationService.navigatorKey,
      initialRoute: RouteList.splash,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child ?? Container()),
      onGenerateRoute: (RouteSettings settings) {
        final routes = Routes.getRoutes(settings);
        final WidgetBuilder builder = routes[settings.name]!;
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
