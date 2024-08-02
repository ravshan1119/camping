import 'package:camping/core/app_colors.dart';
import 'package:camping/core/app_icons.dart';
import 'package:camping/core/app_images.dart';
import 'package:camping/core/constants.dart';
import 'package:camping/core/extension.dart';
import 'package:camping/screens/common/text_form_field_widget.dart';
import 'package:camping/screens/common/text_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddTripLocationsPage extends StatefulWidget {
  const AddTripLocationsPage({super.key});

  @override
  State<AddTripLocationsPage> createState() => _AddTripLocationsPageState();
}

class _AddTripLocationsPageState extends State<AddTripLocationsPage> {
  final _carouselController = CarouselController();
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          splashRadius: 28,
          color: AppColors.black,
          icon: Icon(Icons.adaptive.arrow_back_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const TextWidget(
          text: "Locations",
          textColor: AppColors.black,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
      body: Column(
        children: [
          40.h,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Row(
              children: [
                Flexible(
                  child: MyTextFormField(
                    fillColor: AppColors.grey_50,
                    radius: 12,
                    textInputType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    controller: _searchController,
                    hintText: 'Search',
                    onChanged: (v) {},
                  ),
                ),
                24.w,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.green_500,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(AppIcons.search),
                  ),
                ),
              ],
            ),
          ),
          48.h,
          CarouselSlider(
              carouselController: _carouselController,
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Stack(
                      children: [
                        Container(
                          height: 400,
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset(
                              AppImages.locationView,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 52,
                          right: 52,
                          bottom: 48,
                          child: TextWidget(
                            text: "Catalina Island",
                            textColor: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 60,
                          right: 60,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.green_500,
                            ),
                            child: Material(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(12),
                                onTap: () {},
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  child: TextWidget(
                                    textAlign: TextAlign.center,
                                    text: "Explore",
                                    textColor: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                onScrolled: (value) {},
                height: 422,
                aspectRatio: 16 / 9,
                viewportFraction: 0.7,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                onPageChanged: (index, reason) {},
                scrollDirection: Axis.horizontal,
              )),
          56.h,
          const Center(
            child: TextWidget(
              text: "Region",
              textColor: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          16.h,
          CarouselSlider(
              carouselController: _carouselController,
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return const Stack(
                      children: [
                        Center(
                          child: TextWidget(
                            text: "North America",
                            textColor: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 32,
                          ),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: 40,
                aspectRatio: 16 / 9,
                viewportFraction: 0.7,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                onPageChanged: (index, reason) {},
                scrollDirection: Axis.horizontal,
              )),
        ],
      ),
    );
  }
}
