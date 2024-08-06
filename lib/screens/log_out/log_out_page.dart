import 'package:camping/core/app_colors.dart';
import 'package:camping/core/app_icons.dart';
import 'package:camping/core/extension.dart';
import 'package:camping/core/route/navigator.dart';
import 'package:camping/core/route/routes_const.dart';
import 'package:camping/data/injection.dart';
import 'package:camping/data/local_storage.dart';
import 'package:camping/screens/common/adaptive_action.dart';
import 'package:camping/screens/common/my_elevated_button.dart';
import 'package:camping/screens/common/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogOutPage extends StatefulWidget {
  const LogOutPage({super.key});

  @override
  State<LogOutPage> createState() => _LogOutPageState();
}

class _LogOutPageState extends State<LogOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        leading: Row(
          children: [
            10.w,
            IconButton(
              splashRadius: 28,
              color: AppColors.black,
              icon: SvgPicture.asset(AppIcons.grid),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        elevation: 0,
        title: const TextWidget(
          text: "Log-out",
          textColor: AppColors.black,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            20.h,
            const TextWidget(
              text:
                  "Logging out will remove your access from this device. And clean your past data. are you still sure want to log-out?",
              textColor: AppColors.grey_500,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            20.h,
            MyElevatedButton(
                expanded: true,
                primaryColor: AppColors.warning,
                child: const TextWidget(
                    text: "Log out",
                    textColor: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
                onTap: () {
                  showAdaptiveDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog.adaptive(
                        content:
                            const Text("Are you sure you want to log out?"),
                        actions: [
                          adaptiveAction(
                              context: context,
                              onPressed: () {
                                getIt<LocalStorage>().setToken("");
                                navigator.pushNamedAndRemoveUntil(
                                    RouteList.auth, (route) => false);
                              },
                              child: const Text(
                                "Yes",
                                style: TextStyle(color: Colors.red),
                              )),
                          adaptiveAction(
                              context: context,
                              onPressed: () {
                                navigator.pop();
                              },
                              child: const Text(
                                "No",
                                style: TextStyle(color: Colors.blue),
                              ))
                        ],
                      );
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
