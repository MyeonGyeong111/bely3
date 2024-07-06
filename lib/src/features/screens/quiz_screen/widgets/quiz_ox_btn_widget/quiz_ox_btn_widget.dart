
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bely2/src/features/controllers/point_screen_controllers/point_controller/point_controller.dart';
import 'package:bely2/src/features/controllers/quiz_screen_controllers/quiz_problem_controller/quiz_problem_controller.dart';
import 'package:bely2/src/utils/theme/text_theme.dart';
import '../../../../../../Point.dart';
import '../../../../../common_widgets/quiz_result_dialog_widget/quiz_result_dialog_widget.dart';
import '../../../../../constants/colors.dart';

class QuizOXBtnWidget extends StatelessWidget {
  const QuizOXBtnWidget({
    required this.answerText,
    super.key
  });

  final String answerText;

  @override
  Widget build(BuildContext context) {
    final pointController = Get.find<PointController>();
    final quizProblemController = Get.find<QuizProblemController>();
    final problem = quizProblemController.problem;
    final checkClick = quizProblemController.checkClick;
    final currentProblemNum = quizProblemController.currentProblemNum;
    final randomIndex = quizProblemController.randomIndex;
    final correct = quizProblemController.correct;

    return Obx(() {
      return InkWell(
        onTap: () async {
          if (checkClick.value == false) {
            checkClick.value = true;
            if (problem[randomIndex[currentProblemNum.value]]['correct'] == answerText) {
              quizProblemController.getPoint(1);
              correct.value = true;
              if (problem[randomIndex[currentProblemNum.value]]['answer'] != null) {
                quizProblemController.onAnswerTimer();
                await Future.delayed(const Duration(seconds: 1), () async {
                  if (currentProblemNum.value < problem.length - 1) {
                    quizProblemController.nextProblem();
                  } else {
                    quizProblemController.onEndTimer(
                      () {
                        Get.offAll(() => const PointPage(), transition: Transition.rightToLeft);
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => QuizResultDialogWidget(
                                totalProblem: problem.length,
                                point: quizProblemController.totalPoint.value
                            )
                        );
                        pointController.getQuizPoint(quizProblemController.totalPoint.value);
                      }
                    );
                  }
                });
              }
              else {
                if (currentProblemNum.value < problem.length - 1) {
                  quizProblemController.nextProblem();
                } else {
                  quizProblemController.onEndTimer(
                    () {
                      Get.offAll(() => const PointPage(), transition: Transition.rightToLeft);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => QuizResultDialogWidget(
                              totalProblem: problem.length,
                              point: quizProblemController.totalPoint.value
                          )
                      );
                      pointController.getQuizPoint(quizProblemController.totalPoint.value);
                    }
                  );
                }
              }
            } else {
              if (problem[randomIndex[currentProblemNum.value]]['answer'] != null) {
                quizProblemController.onAnswerTimer();
                await Future.delayed(const Duration(seconds: 1), () async {
                  if (currentProblemNum.value < problem.length - 1) {
                    quizProblemController.nextProblem();
                  } else {
                    quizProblemController.onEndTimer(
                      () {
                        Get.offAll(() => const PointPage(), transition: Transition.rightToLeft);
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => QuizResultDialogWidget(
                                totalProblem: problem.length,
                                point: quizProblemController.totalPoint.value
                            )
                        );
                        pointController.getQuizPoint(quizProblemController.totalPoint.value);
                      }
                    );
                  }
                });
              }
              else {
                if (currentProblemNum.value < problem.length - 1) {
                  quizProblemController.nextProblem();
                } else {
                  quizProblemController.onEndTimer(
                    () {
                      Get.offAll(() => const PointPage(), transition: Transition.rightToLeft);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => QuizResultDialogWidget(
                              totalProblem: problem.length,
                              point: quizProblemController.totalPoint.value
                          )
                      );
                      pointController.getQuizPoint(quizProblemController.totalPoint.value);
                    }
                  );
                }
              }
            }
          }
        },
        child: Container(
          width: 164.w,
          height: 25.h,
          decoration: BoxDecoration(
            border: Border.all(
              width: checkClick.value == true
                ? problem[randomIndex[currentProblemNum.value]]['correct'] == answerText ? 2.w : 1.w : 1.w,
                color: checkClick.value == true ? problem[randomIndex[currentProblemNum.value]]['correct'] == answerText ? tBorderColor4 : tBorderColor2 : tBorderColor2,
            ),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Center(
            child: Text(answerText, style: Theme.of(context).textTheme.nanum.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 15.sp,
                height: 1.0,
              )
            ),
          ),
        ),
      );
    });
  }
}