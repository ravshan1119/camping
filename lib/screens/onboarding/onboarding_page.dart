import 'package:camping/core/app_colors.dart';
import 'package:camping/core/app_icons.dart';
import 'package:camping/core/extension.dart';
import 'package:camping/core/route/navigator.dart';
import 'package:camping/core/route/routes_const.dart';
import 'package:camping/screens/auth/bloc/auth_bloc.dart';
import 'package:camping/screens/common/text_widget.dart';
import 'package:camping/screens/onboarding/widgets/page_view_card.dart';
import 'package:camping/screens/onboarding/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _controller = PageController();

  int currentPage = 0;

  static const _kDuration = Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  final List<Widget> _pages = <Widget>[
    const PageViewCard(
      imagePath: AppIcons.onboarding_1,
      text: "Your Tasks",
      description:
          "I always reminds you about your planned activities. which is always my priority and your importance.",
    ),
    const PageViewCard(
      imagePath: AppIcons.onboarding_2,
      text: "Capture Your Memories",
      description:
          "We know that catching photos are necessary in your trip. that’s why we have built-in camera and gallery feature.",
    ),
    const PageViewCard(
      imagePath: AppIcons.onboarding_3,
      text: "Track Your Fitness",
      description:
          "Fitness is one of the main thing which is really inportant to your body and we track it in every second.",
    ),
    const PageViewCard(
      imagePath: AppIcons.onboarding_4,
      text: "There Is Much More",
      description:
          "We have bunch of other cool features. which is super helpful for your next camping trip. so what are you waiting for?",
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final _bloc = AuthBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      bloc: _bloc,
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              100.h,
              Expanded(
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 4,
                  controller: _controller,
                  itemBuilder: (BuildContext context, int index) {
                    currentPage = index;
                    return _pages[index % _pages.length];
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    currentPage == 0
                        ? Container(
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            height: 40,
                            width: 40,
                          )
                        : Container(
                            decoration: const BoxDecoration(
                              color: AppColors.green_100,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                onTap: () {
                                  _controller.previousPage(
                                      duration: _kDuration, curve: _kCurve);
                                  currentPage--;
                                  setState(() {});
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(AppIcons.arrowLeft),
                                ),
                              ),
                            ),
                          ),
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 4,
                      axisDirection: Axis.horizontal,
                      effect: const SlideEffect(
                        type: SlideType.slideUnder,
                        spacing: 12.0,
                        radius: 50.0,
                        dotWidth: 8.0,
                        dotHeight: 8.0,
                        // paintStyle:  PaintingStyle.stroke,
                        strokeWidth: 1.5,
                        dotColor: AppColors.grey_100,
                        activeDotColor: AppColors.green_500,
                      ),
                    ),
                    currentPage == 3
                        ? Container(
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            height: 40,
                            width: 40,
                          )
                        : Container(
                            decoration: const BoxDecoration(
                              color: AppColors.green_900,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                onTap: () {
                                  _controller.nextPage(
                                      duration: _kDuration, curve: _kCurve);
                                  currentPage++;
                                  setState(() {});
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(AppIcons.arrowRight),
                                ),
                              ),
                            ),
                          )
                  ],
                ),
              ),
              36.h,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SubmitButton(
                    controller: _controller,
                    onTap: () {
                      navigator.pushNamed(RouteList.login);
                    }),
              ),
              16.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextWidget(
                      text: "Don’t have an Account? ",
                      textColor: AppColors.grey_900,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                  TextButton(
                    onPressed: () {
                      navigator.pushReplacementNamed(RouteList.auth);
                    },
                    child: const TextWidget(
                        text: "Register",
                        textColor: AppColors.grey_900,
                        fontWeight: FontWeight.w700,
                        fontSize: 14),
                  )
                ],
              ),
              70.h,
            ],
          ),
        );
      },
    );
  }
}
