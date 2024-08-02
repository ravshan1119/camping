import 'package:camping/core/app_colors.dart';
import 'package:camping/core/app_icons.dart';
import 'package:camping/core/extension.dart';
import 'package:camping/screens/common/custom_check_box.dart';
import 'package:camping/screens/common/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  bool value = true;
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
          text: "Language",
          textColor: AppColors.black,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
      body: Column(
        children: [
          20.h,
          ListTile(
            onTap: () {},
            trailing: CustomCheckbox(
                activeColor: AppColors.green_500,
                fillColor: MaterialStateProperty.all(AppColors.green_500),
                value: value,
                onChanged: (v) {
                  setState(() {
                    value = v ?? false;
                  });
                }),
            title: const TextWidget(
              text: 'English',
              textColor: AppColors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          ListTile(
            onTap: () {},
            trailing: CustomCheckbox(
                activeColor: AppColors.green_500,
                fillColor: MaterialStateProperty.all(AppColors.green_500),
                value: value,
                onChanged: (v) {
                  setState(() {
                    value = v ?? false;
                  });
                }),
            title: const TextWidget(
              text: 'ودُراُ',
              textColor: AppColors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          ListTile(
            onTap: () {},
            trailing: CustomCheckbox(
                activeColor: AppColors.green_500,
                fillColor: MaterialStateProperty.all(AppColors.green_500),
                value: value,
                onChanged: (v) {
                  setState(() {
                    value = v ?? false;
                  });
                }),
            title: const TextWidget(
              text: 'हिंदी ',
              textColor: AppColors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          ListTile(
            onTap: () {},
            trailing: CustomCheckbox(
                activeColor: AppColors.green_500,
                fillColor: MaterialStateProperty.all(AppColors.green_500),
                value: value,
                onChanged: (v) {
                  setState(() {
                    value = v ?? false;
                  });
                }),
            title: const TextWidget(
              text: 'Español',
              textColor: AppColors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          ListTile(
            onTap: () {},
            trailing: CustomCheckbox(
                activeColor: AppColors.green_500,
                fillColor: MaterialStateProperty.all(AppColors.green_500),
                value: value,
                onChanged: (v) {
                  setState(() {
                    value = v ?? false;
                  });
                }),
            title: const TextWidget(
              text: 'Deutsche',
              textColor: AppColors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
