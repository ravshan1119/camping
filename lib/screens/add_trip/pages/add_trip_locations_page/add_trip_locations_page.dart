import 'package:camping/core/app_colors.dart';
import 'package:camping/core/app_icons.dart';
import 'package:camping/core/app_images.dart';
import 'package:camping/core/extension.dart';
import 'package:camping/core/route/navigator.dart';
import 'package:camping/core/route/routes_const.dart';
import 'package:camping/screens/add_trip/pages/add_trip_location_search_page/add_trip_lcoation_search_page.dart';
import 'package:camping/screens/common/text_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

class AddTripLocationsPage extends StatefulWidget {
  const AddTripLocationsPage({super.key});

  @override
  State<AddTripLocationsPage> createState() => _AddTripLocationsPageState();
}

class _AddTripLocationsPageState extends State<AddTripLocationsPage> {
  final _carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
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
          20.h,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.grey_50,
                      border: Border.all(
                        color: AppColors.grey_100,
                      ),
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child: const AddTripLocationSearchPage()));
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              TextWidget(
                                textAlign: TextAlign.center,
                                text: "Search",
                                textColor: AppColors.grey_400,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                24.w,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.green_500,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: const AddTripLocationSearchPage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: SvgPicture.asset(
                          AppIcons.search,
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
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
                          height: MediaQuery.of(context).size.height * 0.45,
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
                          left: 10,
                          right: 10,
                          bottom: 48,
                          child: TextWidget(
                            textAlign: TextAlign.center,
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
                                onTap: () {
                                  navigator
                                      .pushNamed(RouteList.addTripLocationView);
                                },
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
                height: MediaQuery.of(context).size.height * 0.45 + 22,
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
                onPageChanged: (index, reason) {
                  _carouselController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                scrollDirection: Axis.horizontal,
              )),
          30.h,
          const Center(
            child: TextWidget(
              text: "Region",
              textColor: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18,
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
                            textAlign: TextAlign.center,
                            text: "North America",
                            textColor: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 28,
                          ),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                scrollPhysics:
                    const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
                onScrolled: (value) {},
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
                onPageChanged: (index, reason) {
                  _carouselController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                scrollDirection: Axis.horizontal,
              )),
        ],
      ),
    );
  }
}
