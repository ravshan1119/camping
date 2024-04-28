import 'package:camping/core/app_colors.dart';
import 'package:camping/screens/common/my_elevated_button.dart';
import 'package:camping/screens/common/text_widget.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key, required this.controller, required this.onTap});

  final PageController controller;

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        int page = controller.page?.round() ?? controller.initialPage;
        return MyElevatedButton(
          primaryColor: AppColors.green_500,
          radius: 12,
          expanded: true,
          height: 58,
          onTap: onTap,
          child: const TextWidget(
            text: "Log in",
            textColor: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        );
      },
    );
  }
}
