
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bely2/src/utils/theme/text_theme.dart';
import '../../../../../common_widgets/common_btn_widget/common_btn_widget.dart';
import '../../../../../constants/colors.dart';
import '../../../photo_tap_screen/photo_tap_screen.dart';

class PointMenuPhotoAuthWidget extends StatelessWidget {
  const PointMenuPhotoAuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300.w,
        height: 195.h,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 2.w, color: tBorderColor),
            borderRadius: BorderRadius.circular(20.r)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("사진 인증", style: Theme.of(context).textTheme.cafe24.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 25.sp,
              height: 1.0,
            )
            ),
            SizedBox(height: 20.h),
            CommonBtnWidget(
              title: 'Tap',
              onTap: (){
                Get.to(() => const PhotoTapScreen(), transition: Transition.rightToLeft);
              }
            ),
          ],
        ),
      ),
    );
  }
}