
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bely2/src/constants/colors.dart';
import 'package:bely2/src/features/controllers/photo_tap_screen_controllers/photo_tab_controller/photo_tab_controller.dart';
import 'package:bely2/src/features/screens/photo_tap_screen/widgets/photo_tap_appbar_widget/photo_tap_appbar_widget.dart';
import 'package:bely2/src/features/screens/photo_tap_screen/widgets/photo_tap_auth_btn_widget/photo_tap_auth_btn_widget.dart';
import 'package:bely2/src/features/screens/photo_tap_screen/widgets/photo_tap_auth_ex_widget/photo_tap_auth_ex_widget.dart';
import 'package:bely2/src/features/screens/photo_tap_screen/widgets/photo_tap_auth_widget/photo_tap_auth_widget.dart';
import 'package:bely2/src/features/screens/photo_tap_screen/widgets/photo_tap_detail_point_widget/photo_tap_detail_point_widget.dart';
import 'package:bely2/src/features/screens/photo_tap_screen/widgets/photo_tap_tabbar_widget/photo_tap_tabbar_widget.dart';
import 'package:bely2/src/utils/theme/text_theme.dart';
import '../../core/controllers/camera_controller.dart';

class PhotoTapScreen extends StatelessWidget {
  const PhotoTapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final photoTabController = Get.find<PhotoTabController>();
    Get.put(CameraController());

    return Scaffold(
      backgroundColor: tBackgroundColor2,
      appBar: const PhotoTapAppbarWidget(),
      body: Column(
        children: [
          const PhotoTapTabbarWidget(),
          Obx(() {
            return photoTabController.tabNum.value == 0 ? Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const PhotoTapAuthBtnWidget(),
                    Container(
                      height: 1.5.h,
                      color: tBorderColor3,
                    ),
                    const PhotoTapDetailPointWidget(),
                    Container(
                      padding: EdgeInsets.only(left: 20.w),
                      height: 40.h,
                      alignment: Alignment.centerLeft,
                      child: Text('나의 인증샷', style: Theme.of(context).textTheme.nanum.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          height: 1.0,
                        )
                      ),
                    ),
                    const PhotoTapAuthExWidget(),
                    const PhotoTapAuthWidget(condition: 'me'),
                  ],
                ),
              ),
            ) : Expanded(
              child: Container(
                color: Colors.white,
                child: const PhotoTapAuthWidget(condition: 'sll'),
              )
            );
          }),
        ]
      )
    );
  }
}
