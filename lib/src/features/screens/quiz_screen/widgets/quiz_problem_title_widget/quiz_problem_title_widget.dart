
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bely2/src/utils/theme/text_theme.dart';
import '../../../../../constants/colors.dart';
import '../../../../controllers/quiz_screen_controllers/quiz_problem_controller/quiz_problem_controller.dart';

class QuizProblemTitleWidget extends StatelessWidget {
  const QuizProblemTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final quizProblemController = Get.find<QuizProblemController>();
    final problem = quizProblemController.problem;
    final currentProblemNum = quizProblemController.currentProblemNum;
    final randomIndex = quizProblemController.randomIndex;

    return Obx(() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        width: 270.w,
        height: 109.h,
        decoration: BoxDecoration(
            border: Border.all(width: 1.w, color: tBorderColor2)
        ),
        child: Center(
          child: Text(
            quizProblemController.showAnswer.value == false
                ? problem[randomIndex[currentProblemNum.value]]['title']
                : problem[randomIndex[currentProblemNum.value]]['answer'],
            style: Theme.of(context).textTheme.nanum.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 15.sp,
              height: 1.0,
            ), textAlign: TextAlign.center,
          ),
        )
      );
    });
  }
}