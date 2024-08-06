import 'package:camping/core/app_colors.dart';
import 'package:camping/core/app_images.dart';
import 'package:camping/core/extension.dart';
import 'package:camping/screens/common/my_elevated_button.dart';
import 'package:camping/screens/common/text_widget.dart';
import 'package:flutter/material.dart';

class EmptyPageAddTeammates extends StatelessWidget {
  const EmptyPageAddTeammates({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AppImages.addTrip, height: 180),
        10.h,
        const TextWidget(
          text: "You didn’t have any teammates added.",
          textColor: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
        8.h,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MyElevatedButton(
            primaryColor: Colors.white,
            elevation: 0,
            expanded: true,
            borderColor: AppColors.green_500,
            onTap: () {},
            child: const TextWidget(
              maxLines: 1,
              text: "Add Teammate",
              textColor: AppColors.green_500,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
