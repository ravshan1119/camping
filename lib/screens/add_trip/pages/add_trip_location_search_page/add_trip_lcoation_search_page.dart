import 'package:camping/core/app_colors.dart';
import 'package:camping/core/app_icons.dart';
import 'package:camping/core/extension.dart';
import 'package:camping/core/route/navigator.dart';
import 'package:camping/screens/add_trip/pages/add_trip_location_search_page/widget/location_search_item.dart';
import 'package:camping/screens/common/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddTripLocationSearchPage extends StatefulWidget {
  const AddTripLocationSearchPage({super.key});

  @override
  State<AddTripLocationSearchPage> createState() =>
      _AddTripLocationSearchPageState();
}

class _AddTripLocationSearchPageState extends State<AddTripLocationSearchPage> {
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            navigator.pop();
          },
          icon: Icon(
            Icons.adaptive.arrow_back_outlined,
            color: Colors.black,
          ),
        ),
        title: MyTextFormField(
          autoFocus: true,
          fillColor: AppColors.grey_50,
          radius: 12,
          textInputType: TextInputType.name,
          textInputAction: TextInputAction.next,
          controller: _searchController,
          hintText: 'Search',
          onChanged: (v) {},
        ),
        actions: [
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
          24.w,
        ],
      ),
      body: ListView(
        children: [
          ...List.generate(
            5,
            (index) => LocationSearchItem(),
          ),
        ],
      ),
    );
  }
}
