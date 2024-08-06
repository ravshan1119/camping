import 'package:camping/core/app_colors.dart';
import 'package:camping/core/extension.dart';
import 'package:camping/screens/add_trip/pages/add_trip_add_teammates_page/widget/empty_page_add_teammates.dart';
import 'package:camping/screens/common/my_elevated_button.dart';
import 'package:camping/screens/common/text_form_field_widget.dart';
import 'package:camping/screens/common/text_widget.dart';
import 'package:flutter/material.dart';

class AddTripAddTeammatesPage extends StatefulWidget {
  const AddTripAddTeammatesPage({super.key});

  @override
  State<AddTripAddTeammatesPage> createState() =>
      _AddTripAddTeammatesPageState();
}

class _AddTripAddTeammatesPageState extends State<AddTripAddTeammatesPage> {
  final _idController = TextEditingController();
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
          text: "Add Teammates",
          textColor: AppColors.black,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
      body: false
          ? const Center(child: EmptyPageAddTeammates())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.h,
                  const Text(
                    "Say your teammate to log-in first on Camping App. then your teammate will automatically recieve the ID. Then put the ID here and he will recieve the notification of invite. When he accept the request he’ll automatically add on to your team.",
                    style: TextStyle(
                      color: AppColors.grey_500,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  20.h,
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextWidget(
                        text: "ID",
                        textColor: AppColors.grey_500,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  8.h,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: MyTextFormField(
                      autoFocus: true,
                      fillColor: AppColors.grey_50,
                      radius: 12,
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      controller: _idController,
                      // error: state.errorEmail,
                      onChanged: (v) {},
                    ),
                  ),
                  20.h,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: MyElevatedButton(
                      expanded: true,
                      radius: 12,
                      onTap: () {},
                      primaryColor: AppColors.green_500,
                      child: const TextWidget(
                          text: "Sent Request",
                          textColor: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
