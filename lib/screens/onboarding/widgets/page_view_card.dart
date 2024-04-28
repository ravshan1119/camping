import 'package:camping/core/app_colors.dart';
import 'package:camping/core/extension.dart';
import 'package:camping/screens/common/text_widget.dart';
import 'package:flutter/material.dart';

class PageViewCard extends StatelessWidget {
  const PageViewCard({super.key, required this.imagePath, required this.text, required this.description});

  final String imagePath;

  final String text;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: Image.asset(imagePath),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: TextWidget(
            text: text,
            textAlign: TextAlign.center,
            textColor: AppColors.black,
            fontWeight: FontWeight.w700,
            fontSize: 32,
          ),
        ),
        8.h,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextWidget(
            text: description,
            textAlign: TextAlign.center,
            textColor: AppColors.grey_700,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        150.h,
      ],
    );
  }
}
