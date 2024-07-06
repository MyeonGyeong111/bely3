
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bely2/src/features/controllers/point_screen_controllers/point_controller/point_controller.dart';
import 'package:bely2/src/features/screens/point_screen/widgets/point_menu_photo_auth_widget/point_menu_photo_auth_widget.dart';
import 'package:bely2/src/features/screens/point_screen/widgets/point_menu_quiz_widget/point_menu_quiz_widget.dart';
import 'package:bely2/src/features/screens/point_screen/widgets/point_menu_show_point_widget/point_menu_show_point_widget.dart';

import '../../controllers/photo_tap_screen_controllers/photo_tab_controller/photo_tab_controller.dart';

class PointScreen extends StatelessWidget {
  const PointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PointController());
    Get.put(PhotoTabController());

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13.w, vertical: 32.h),
      child: Column(
        children: [
          const PointMenuPhotoAuthWidget(),
          SizedBox(height: 15.h),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PointMenuShowPointWidget(),
              PointMenuQuizWidget(),
            ],
          )
        ],
      ),
    );
  }
}
