import 'package:camping/core/app_colors.dart';
import 'package:camping/core/app_icons.dart';
import 'package:camping/core/constants.dart';
import 'package:camping/core/extension.dart';
import 'package:camping/core/route/navigator.dart';
import 'package:camping/core/route/routes_const.dart';
import 'package:camping/data/injection.dart';
import 'package:camping/data/local_storage.dart';
import 'package:camping/screens/add_trip/widget/drawer.dart';
import 'package:camping/screens/add_trip/widget/empty_page.dart';
import 'package:camping/screens/add_trip/widget/your_id.dart';
import 'package:camping/screens/common/my_elevated_button.dart';
import 'package:camping/screens/common/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddTripPage extends StatefulWidget {
  const AddTripPage({super.key});

  @override
  State<AddTripPage> createState() => _AddTripPageState();
}

class _AddTripPageState extends State<AddTripPage> {
  final _advancedDrawerController = AdvancedDrawerController();
  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.green_700],
          ),
        ),
      ),
      backdropColor: AppColors.green_700,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      openRatio: 0.5,
      openScale: 0.75,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        color: AppColors.green_700,
        borderRadius: const BorderRadius.all(Radius.circular(40)),
      ),

      drawer: const DrawerItem(),

      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 60,
          toolbarHeight: 80,
          elevation: 0,
          leading: Row(
            children: [
              10.w,
              IconButton(
                onPressed: _handleMenuButtonPressed,
                icon: ValueListenableBuilder<AdvancedDrawerValue>(
                  valueListenable: _advancedDrawerController,
                  builder: (_, value, __) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: SvgPicture.asset(AppIcons.grid),
                    );
                  },
                ),
              ),
            ],
          ),
          title: const TextWidget(
              text: "Camping Trips",
              textColor: AppColors.black,
              fontWeight: FontWeight.w700,
              fontSize: 20),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                navigator.pushNamed(RouteList.notifications);
              },
              icon: SvgPicture.asset(AppIcons.notification),
            ),
            10.w,
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              28.h,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: YourID(
                  id: "CMP21992822",
                ),
              ),
              const EmptyPage()
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: MyElevatedButton(
              onTap: () {},
              expanded: true,
              primaryColor: AppColors.green_500,
              child: const TextWidget(
                  text: "Start New Trip",
                  textColor: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18)),
        ),
      ),
    );
  }
}


