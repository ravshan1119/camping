import 'package:camping/core/app_colors.dart';
import 'package:camping/core/app_icons.dart';
import 'package:camping/core/extension.dart';
import 'package:camping/data/models/notifications_model.dart';
import 'package:camping/screens/common/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.notification});
  final NotificationsModel notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.green_50,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.green_100,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(AppIcons.award),
              ),
            ),
            16.w,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: notification.title ?? '',
                  textColor: AppColors.green_900,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                8.h,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextWidget(
                    maxLines: 2,
                    overFlow: TextOverflow.ellipsis,
                    text: notification.description ?? '',
                    textColor: AppColors.green_700,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
