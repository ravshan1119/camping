import 'package:camping/core/app_images.dart';
import 'package:camping/core/extension.dart';
import 'package:camping/screens/common/text_widget.dart';
import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        150.h,
        Image.asset(AppImages.addTrip, height: 180),
        10.h,
        const TextWidget(
          text: "You didn’t add any trips before.",
          textColor: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 18,
        )
      ],
    );
  }
}
