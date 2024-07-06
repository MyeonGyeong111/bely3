
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/quiz_screen_controllers/quiz_problem_controller/quiz_problem_controller.dart';

class QuizProblemImageWidget extends StatelessWidget {
  const QuizProblemImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final quizProblemController = Get.find<QuizProblemController>();
    final problem = quizProblemController.problem;
    final currentProblemNum = quizProblemController.currentProblemNum;
    final randomIndex = quizProblemController.randomIndex;

    return Obx(() {
      return Image.asset(
        problem[randomIndex[currentProblemNum.value]]['image'],
        width:60.w,
        height:80.h,
        fit: BoxFit.fill,
      );
    });
  }
}