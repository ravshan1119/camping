import 'package:camping/core/app_colors.dart';
import 'package:camping/core/extension.dart';
import 'package:camping/screens/common/text_widget.dart';
import 'package:flutter/material.dart';

class HowToUseItem extends StatelessWidget {
  const HowToUseItem(
      {super.key,
      required this.title,
      required this.description,
      required this.index});
  final int index;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.green_50,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.green_100,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: TextWidget(
                      text: index.toString(),
                      textColor: AppColors.green_900,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              16.w,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: title,
                    textColor: AppColors.green_900,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  8.h,
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: Text(
                      description,
                      style: const TextStyle(
                        color: AppColors.green_700,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat',
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 3,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
