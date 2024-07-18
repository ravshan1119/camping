import 'package:camping/core/route/routes_const.dart';
import 'package:camping/data/injection.dart';
import 'package:camping/data/local_storage.dart';
import 'package:flutter/material.dart';

class AddTripPage extends StatefulWidget {
  const AddTripPage({super.key});

  @override
  State<AddTripPage> createState() => _AddTripPageState();
}

class _AddTripPageState extends State<AddTripPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Add Trip",
              style: TextStyle(color: Colors.black),
            ),
            TextButton(
                onPressed: () {
                  getIt<LocalStorage>().setToken("").then((value) {
                    Navigator.of(context)
                        .pushReplacementNamed(RouteList.splash);
                  });
                },
                child: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ))
          ],
        ),
      ),
    );
  }
}
