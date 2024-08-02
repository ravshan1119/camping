import 'package:camping/core/app_colors.dart';
import 'package:camping/core/extension.dart';
import 'package:camping/core/route/navigator.dart';
import 'package:camping/core/route/routes_const.dart';
import 'package:camping/screens/add_trip/bloc/add_trip_bloc.dart';
import 'package:camping/screens/common/my_elevated_button.dart';
import 'package:camping/screens/common/text_form_field_widget.dart';
import 'package:camping/screens/common/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTripStartPage extends StatefulWidget {
  const AddTripStartPage({super.key});

  @override
  State<AddTripStartPage> createState() => _AddTripStartPageState();
}

class _AddTripStartPageState extends State<AddTripStartPage> {
  final _tripNameController = TextEditingController();

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
          text: "Add New Trip",
          textColor: AppColors.black,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
      body: BlocConsumer<AddTripBloc, AddTripState>(
        listener: (context, state) {
          print("state: ${state.tripName}");
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  30.h,
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                          textAlign: TextAlign.start,
                          text: "Trip Name",
                          textColor: AppColors.grey_500,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ],
                  ),
                  8.h,
                  MyTextFormField(
                    fillColor: AppColors.grey_50,
                    radius: 12,
                    textInputType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    controller: _tripNameController,
                    // error: state.errorEmail,
                    onChanged: (v) {
                      context
                          .read<AddTripBloc>()
                          .add(ChangeTripNameEvent(tripName: v));
                    },
                  ),
                  20.h,
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                          textAlign: TextAlign.start,
                          text: "Location",
                          textColor: AppColors.grey_500,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ],
                  ),
                  8.h,
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.grey_50,
                      border: Border.all(color: AppColors.grey_100),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          navigator.pushNamed(RouteList.addTripLocation);
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 18, horizontal: 16),
                          child: TextWidget(
                            text: "",
                            textColor: AppColors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  16.h,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: AppColors.green_500),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Material(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 16),
                              child: TextWidget(
                                text: "View Locations",
                                textColor: AppColors.green_500,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  20.h,
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                          textAlign: TextAlign.start,
                          text: "Teammates",
                          textColor: AppColors.grey_500,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ],
                  ),
                  8.h,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: AppColors.grey_50,
                          border: Border.all(color: AppColors.grey_100),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Material(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {},
                            child: const Center(
                              child: TextWidget(
                                text: "+",
                                textColor: AppColors.grey_400,
                                fontWeight: FontWeight.w400,
                                fontSize: 40,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  16.h,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: AppColors.green_500),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Material(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 16),
                              child: TextWidget(
                                text: "Add New Teammates",
                                textColor: AppColors.green_500,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  20.h,
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.grey_50,
                      border: Border.all(color: AppColors.grey_100),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {},
                        child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 18, horizontal: 16),
                            child: Row(
                              children: [
                                TextWidget(
                                    text: "Pick Date",
                                    textColor: AppColors.grey_400,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                                Spacer(),
                                Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  color: AppColors.grey_400,
                                )
                              ],
                            )),
                      ),
                    ),
                  ),
                  24.h,
                  MyElevatedButton(
                      onTap: () {},
                      expanded: true,
                      primaryColor: AppColors.green_500,
                      child: const TextWidget(
                        text: "Start",
                        textColor: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
