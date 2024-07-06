
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bely2/src/constants/colors.dart';
import 'package:bely2/src/features/controllers/photo_tap_screen_controllers/photo_tab_controller/photo_tab_controller.dart';

class PhotoTapTabbarWidget extends StatelessWidget {
  const PhotoTapTabbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final photoTabController = Get.find<PhotoTabController>();

    return Container(
      height: 45.h,
      color: tTabColor,
      child: TabBar(
        indicator: const BoxDecoration(
          color: tTabColor2,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        labelPadding: EdgeInsets.zero,
        labelColor: Colors.black,
        labelStyle: TextStyle(fontFamily: 'Nanum', fontWeight: FontWeight.w500, fontSize: 16.sp),
        dividerColor: Colors.transparent,
        unselectedLabelColor: Colors.black,
        controller: photoTabController.tabController,
        tabs: photoTabController.myTabs,
        onTap: photoTabController.onItemTapped,
      ),
    );
  }
}