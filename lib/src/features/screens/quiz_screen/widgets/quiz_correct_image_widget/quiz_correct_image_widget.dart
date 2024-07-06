
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bely2/src/utils/theme/text_theme.dart';
import '../../../../controllers/quiz_screen_controllers/quiz_problem_controller/quiz_problem_controller.dart';

class QuizCorrectImageWidget extends StatelessWidget {
  const QuizCorrectImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final quizProblemController = Get.find<QuizProblemController>();
    final checkClick = quizProblemController.checkClick;

    return Obx(() {
      return checkClick.value == true
          ? quizProblemController.correct.value == true
          ? Positioned(
          bottom: 23.h,
          right: 7.w,
          child: Row(
            children: [
              Image.asset(
                'asset/images/png/image_correct.png',
                width: 45.w,
                height: 40.h,
                fit: BoxFit.fill,
              ),
              Text("+ 1P", style: Theme.of(context).textTheme.nanum.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 15.sp,
                height: 1.0,
              )
              ),
            ],
          )
      ) : Container() : Container();
    });
  }
}