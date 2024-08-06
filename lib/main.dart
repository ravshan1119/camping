import 'package:camping/core/constants.dart';
import 'package:camping/core/route/navigator.dart';
import 'package:camping/core/route/routes.dart';
import 'package:camping/core/route/routes_const.dart';
import 'package:camping/core/theme.dart';
import 'package:camping/data/hive_storage/hive_db.dart';
import 'package:camping/data/injection.dart';
import 'package:camping/screens/add_trip/bloc/add_trip_bloc.dart';
import 'package:camping/screens/auth/bloc/auth_bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  await Firebase.initializeApp();
  await hiveInit();
  await getItInit();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc()),
        BlocProvider(create: (_) => AddTripBloc()),
      ],
      child: MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: 'Camping',
        theme: themeData,
        navigatorKey: NavigationService.navigatorKey,
        initialRoute: RouteList.splash,
        debugShowCheckedModeBanner: false,
        // builder: (context, child) => MediaQuery(
        //     data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        //     child: child ?? Container()),
        onGenerateRoute: (RouteSettings settings) {
          final routes = Routes.getRoutes(settings);
          final WidgetBuilder builder = routes[settings.name]!;
          return MaterialPageRoute(builder: builder, settings: settings);
        },
      ),
    );
  }
}

hiveInit() async {
  await Hive.initFlutter();

  debugPrint(
      "Hive init start: ${DateTime.now().minute}:${DateTime.now().second}:${DateTime.now().millisecond}");

  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  try {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(HiveDBAdapter());
    }

    if (!Hive.isBoxOpen(hiveDb)) {
      await Hive.openBox<HiveDB>(hiveDb);
    }
  } catch (e) {
    debugPrint('Error: $e');
    await Hive.deleteBoxFromDisk(hiveDb, path: directory.path);
    hiveInit();
    return;
  }

  Box<HiveDB> box = Hive.box(hiveDb);
  HiveDB? hive = box.get(hiveDb);
  if (hive == null) {
    box.put(hiveDb, HiveDB());
  }

  DateTime? date = hive?.date;
  DateTime now = DateTime.now();

  if (date != null) {
    if (date.isBefore(DateTime(now.year, now.month, now.day - 7))) {
      box.put(hiveDb, HiveDB());
    }
  } else {
    box.put(
        hiveDb,
        hive ?? HiveDB()
          ..date = now);
  }

  debugPrint(
      "Hive init end: ${DateTime.now().minute}:${DateTime.now().second}:${DateTime.now().millisecond}");
}
