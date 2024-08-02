import 'package:camping/core/app_colors.dart';
import 'package:camping/data/models/notifications_model.dart';
import 'package:camping/screens/common/loader.dart';
import 'package:camping/screens/common/text_widget.dart';
import 'package:camping/screens/notifications/widget/notification_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  void initState() {
    super.initState();
  }

  final Stream<QuerySnapshot> _notifications =
      FirebaseFirestore.instance.collection('notifications').snapshots();

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
      body: StreamBuilder(
        stream: _notifications,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print("Snapshot error: ${snapshot.error}");
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Loader());
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: NotificationItem(
                    notification: NotificationsModel.fromJson(data)),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
