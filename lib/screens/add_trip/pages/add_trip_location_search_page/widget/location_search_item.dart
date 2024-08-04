import 'package:camping/core/app_colors.dart';
import 'package:camping/core/app_images.dart';
import 'package:camping/core/extension.dart';
import 'package:camping/core/route/navigator.dart';
import 'package:camping/core/route/routes_const.dart';
import 'package:camping/screens/common/text_widget.dart';
import 'package:flutter/material.dart';

class LocationSearchItem extends StatefulWidget {
  const LocationSearchItem({super.key});

  @override
  State<LocationSearchItem> createState() => _LocationSearchItemState();
}

class _LocationSearchItemState extends State<LocationSearchItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            print("tap");
            navigator.pushNamed(RouteList.addTripLocationView);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Row(
              children: [
                Container(
                  height: 70,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        AppImages.locationView,
                        fit: BoxFit.cover,
                      )),
                ),
                12.w,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(
                      text: "Catalina Island",
                      textColor: AppColors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                    4.h,
                    const TextWidget(
                      text: "Los Angeles, California",
                      textColor: AppColors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
