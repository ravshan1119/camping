import 'package:camping/core/app_colors.dart';
import 'package:camping/core/app_icons.dart';
import 'package:camping/core/extension.dart';
import 'package:camping/screens/common/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class YourID extends StatelessWidget {
  const YourID({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.green_50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextWidget(
                  text: "your ID",
                  textColor: AppColors.green_600,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                10.h,
                TextWidget(
                  text: id,
                  textColor: AppColors.green_900,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(),
                IconButton(
                    onPressed: () {}, icon: SvgPicture.asset(AppIcons.copy)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
