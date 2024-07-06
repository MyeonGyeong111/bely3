
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bely2/src/utils/theme/text_theme.dart';
import '../../../../../constants/colors.dart';
import '../../../../core/controllers/camera_controller.dart';

class PhotoTapAuthBtnWidget extends StatelessWidget {
  const PhotoTapAuthBtnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cameraController = Get.find<CameraController>();

    return Container(
      height: 85.h,
      color: Colors.white,
      child: Center(
        child: InkWell(
          onTap: () {
            cameraController.getImage(ImageSource.camera);
          },
          child: Container(
            width: 196.w,
            height: 37.h,
            decoration: BoxDecoration(
              color: tAppbarColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Center(
              child: Text("사진 인증", style: Theme.of(context).textTheme.nanum.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                  height: 1.0,
                )
              ),
            ),
          ),
        )
      ),
    );
  }
}