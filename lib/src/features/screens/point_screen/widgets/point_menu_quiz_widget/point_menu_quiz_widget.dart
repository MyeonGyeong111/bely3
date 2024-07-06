
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bely2/src/utils/theme/text_theme.dart';
import '../../../../../common_widgets/common_btn_widget/common_btn_widget.dart';
import '../../../../../constants/colors.dart';
import '../../../quiz_screen/quiz_screen.dart';

class PointMenuQuizWidget extends StatelessWidget {
  const PointMenuQuizWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
          Text("오늘의 Quiz", style: Theme.of(context).textTheme.cafe24.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 20.sp,
            height: 1.0,
          )
          ),
          SizedBox(height: 20.h),
          CommonBtnWidget(
            title: '시작하기',
            onTap: (){
              Get.to(() => const QuizScreen(), transition: Transition.rightToLeft);
            }
          ),
        ],
      ),
    );
  }
}