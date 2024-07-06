
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bely2/src/utils/theme/text_theme.dart';
import '../../../../../constants/colors.dart';
import '../../../../controllers/point_screen_controllers/point_controller/point_controller.dart';

class PhotoTapDetailPointWidget extends StatelessWidget {
  const PhotoTapDetailPointWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final pointController = Get.find<PointController>();

    return Container(
      height: 122.h,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 63.w,
            height: 63.h,
            decoration: const BoxDecoration(
              color: tCircleColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Obx(() {
                return Text('${pointController.photoPoint[3]}P',
                    style: Theme.of(context).textTheme.cafe24.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 18.sp,
                      height: 1.0,
                    )
                );
              }),
            ),
          ),
          SizedBox(width: 24.w),
          Text("인증횟수"
              "\n"
              "신고 받은 횟수"
              "\n"
              "성공횟수"
              "\n"
              "총", style: Theme.of(context).textTheme.nanum.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 13.sp,
            height: 1.6,
          )
          ),
          SizedBox(width: 12.w),
          Obx(() {
            return Text(
                '${pointController.photoPoint[0]}회'
                    "\n"
                    '${pointController.photoPoint[1]}회'
                    "\n"
                    '${pointController.photoPoint[2]}회'
                    "\n"
                    '${pointController.photoPoint[3]}P',
                style: Theme.of(context).textTheme.nanum.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp,
                  height: 1.6,
                )
            );
          }),
        ],
      ),
    );
  }
}