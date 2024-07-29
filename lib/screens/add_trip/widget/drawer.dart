import 'package:camping/core/app_colors.dart';
import 'package:camping/core/app_icons.dart';
import 'package:camping/core/app_images.dart';
import 'package:camping/core/extension.dart';
import 'package:camping/core/route/navigator.dart';
import 'package:camping/core/route/routes_const.dart';
import 'package:camping/data/injection.dart';
import 'package:camping/data/local_storage.dart';
import 'package:camping/screens/common/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: ListTileTheme(
            contentPadding: EdgeInsets.zero,
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 64.0,
                    height: 64.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      AppImages.avatar,
                    ),
                  ),
                  Row(
                    children: [
                      const TextWidget(
                        text: "Will Smith",
                        textColor: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      IconButton(
                          splashRadius: 24,
                          onPressed: () {},
                          icon: SvgPicture.asset(AppIcons.edit))
                    ],
                  ),
                  20.h,
                  Material(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {},
                      child: Container(
                        height: 48,
                        width: 125,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Row(
                            children: [
                              SvgPicture.asset(AppIcons.home),
                              14.w,
                              const TextWidget(
                                text: "Home",
                                textColor: AppColors.green_900,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  24.h,
                  ListTile(
                    onTap: () {
                      navigator.pushNamed(RouteList.howToUse);
                    },
                    leading: SvgPicture.asset(AppIcons.questionMark),
                    title: const Text('How To use'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: SvgPicture.asset(AppIcons.language),
                    title: const Text('Language'),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: SvgPicture.asset(AppIcons.logout),
                    title: const Text('Log-out'),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Positioned(
        //   bottom: 100,
        //   right: 0,
        //   top: 100,
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color: Colors.white.withOpacity(0.3),
        //       borderRadius: const BorderRadius.only(
        //           topLeft: Radius.circular(40),
        //           bottomLeft: Radius.circular(40)),
        //     ),
        //     height: MediaQuery.of(context).size.height * 0.6,
        //     width: MediaQuery.of(context).size.width * 0.4,
        //   ),
        // )
      ],
    );
  }
}
