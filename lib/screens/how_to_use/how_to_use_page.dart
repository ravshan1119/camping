import 'package:camping/core/app_colors.dart';
import 'package:camping/core/app_icons.dart';
import 'package:camping/core/extension.dart';
import 'package:camping/screens/common/loader.dart';
import 'package:camping/screens/common/text_widget.dart';
import 'package:camping/screens/how_to_use/widget/how_to_use_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HowToUsePage extends StatefulWidget {
  const HowToUsePage({super.key});

  @override
  State<HowToUsePage> createState() => _HowToUsePageState();
}

class _HowToUsePageState extends State<HowToUsePage> {
  final Stream<QuerySnapshot> _howToUse =
      FirebaseFirestore.instance.collection('how_to_use').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        leading: Row(
          children: [
            10.w,
            IconButton(
              splashRadius: 28,
              color: AppColors.black,
              icon: SvgPicture.asset(AppIcons.grid),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        elevation: 0,
        title: const TextWidget(
          text: "How To Use",
          textColor: AppColors.black,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
      body: StreamBuilder(
        stream: _howToUse,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Loader(),
            );
          }
          if (snapshot.hasError) {
            print("Snapshot error: ${snapshot.error}");
            return const Text('Something went wrong');
          }
          return ListView(
            children:
                snapshot.data!.docs.reversed.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: HowToUseItem(
                    title: data['title'],
                    description: data['description'],
                    index: data['index']),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
