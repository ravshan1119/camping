import 'package:camping/core/app_colors.dart';
import 'package:camping/core/app_images.dart';
import 'package:camping/core/extension.dart';
import 'package:camping/core/route/navigator.dart';
import 'package:camping/screens/common/my_elevated_button.dart';
import 'package:camping/screens/common/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTripLocationView extends StatefulWidget {
  const AddTripLocationView({super.key});

  @override
  State<AddTripLocationView> createState() => _AddTripLocationViewState();
}

class _AddTripLocationViewState extends State<AddTripLocationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Image.asset(AppImages.locationView,fit: BoxFit.cover,),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black45.withOpacity(0.5),
                  ),
                  height: 32,
                  width: 32,
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {
                        navigator.pop();
                      },
                      child: Center(
                        child: Icon(
                          Icons.adaptive.arrow_back_outlined,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                const TextWidget(
                  text: "Catalina Island",
                  textColor: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                ),
                const TextWidget(
                  text: "Los Angeles, California",
                  textColor: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
                8.h,
                const TextWidget(
                  text:
                      "One of California’s Channel Islands, lies southwest of Los Angeles. It's known for its wildlife, dive sites and Mt. Orizaba, its highest peak. The resort town of Two Harbors lies to the north. Best for Campers.",
                  textColor: AppColors.grey_300,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                24.h,
                MyElevatedButton(
                  onTap: (){},
                  expanded: true,
                  primaryColor: AppColors.green_500,
                  child: const TextWidget(
                    text: "Select Location",
                    textColor: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),24.h,
              ],
            ),
          )
        ],
      ),
    );
  }
}
