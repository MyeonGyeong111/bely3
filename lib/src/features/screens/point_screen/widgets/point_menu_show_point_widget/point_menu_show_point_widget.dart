
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bely2/src/utils/theme/text_theme.dart';
import '../../../../../common_widgets/common_btn_widget/common_btn_widget.dart';
import '../../../../../constants/colors.dart';
import '../../../../controllers/point_screen_controllers/point_controller/point_controller.dart';

class PointMenuShowPointWidget extends StatelessWidget {
  const PointMenuShowPointWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final pointController = Get.find<PointController>();

    return Container(
      width: 157.w,
      height: 224.h,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 2.w, color: tBorderColor),
          borderRadius: BorderRadius.circular(40.r)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 120.w,
            height: 120.h,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  'asset/images/png/rec.png',
                  fit: BoxFit.fill,
                ),
                Obx(() {
                  return Text(
                      '${pointController.total.value}P', style: Theme.of(context).textTheme.cafe24.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20.sp,
                    height: 1.0,
                  )
                  );
                }),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("사진인증"
                  "\n"
                  "Quiz", style: Theme.of(context).textTheme.nanum.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 13.sp,
                height: 1.2,
              )
              ),
              SizedBox(width: 10.w),
              Obx(() {
                return Text(
                    '${pointController.photoPoint[3]}P'
                        "\n"
                        '${pointController.quizPoint.value}P',
                    style: Theme.of(context).textTheme.nanum.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp,
                      height: 1.2,
                    )
                );
              }),
            ],
          ),
          SizedBox(height: 10.h),
          CommonBtnWidget(title: '포인트 Shop', onTap: (){}),
        ],
      ),
    );
  }
}