import 'package:camping/core/app_colors.dart';
import 'package:camping/core/extension.dart';
import 'package:camping/screens/common/text_widget.dart';
import 'package:camping/screens/notifications/widget/notification_item.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          splashRadius: 28,
          color: AppColors.black,
          icon: Icon(Icons.adaptive.arrow_back_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        title: const TextWidget(
          text: "Camping Trips",
          textColor: AppColors.black,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          20.h,
          const Center(
            child: TextWidget(
              text: "11 Feb 2020",
              textColor: AppColors.grey_400,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
          18.h,
          const NotificationItem()
        ],
      ),
    );
  }
}
