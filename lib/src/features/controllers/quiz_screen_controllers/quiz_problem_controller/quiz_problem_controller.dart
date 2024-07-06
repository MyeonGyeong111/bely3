
import 'dart:async';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class QuizProblemController extends GetxController{
  late final List<int> randomIndex;
  RxInt currentProblemNum = 0.obs;
  RxBool correct = false.obs;
  RxInt totalPoint = 0.obs;
  Timer answerTimer = Timer(const Duration(seconds: 0), () {});
  Timer nextTimer = Timer(const Duration(seconds: 0), () {});
  Timer endTimer = Timer(const Duration(seconds: 0), () {});
  RxBool showAnswer = false.obs;
  RxBool checkClick = false.obs;
  RxList problem = [
    {
      'image': 'asset/images/png/image_battery.jpg',
      'title': '건전지는 일반 쓰레기로 버려도 된다.',
      'answer': '유해 폐기물로 분류하여 별도로 처리해야 합니다.',
      'correct': 'X',
    }.obs,
    {
      'image': 'asset/images/png/image_cup.jpg',
      'title': '음식물이 묻은 종이컵은 재활용이 가능하다.',
      'answer': '음식물로 오염된 경우는 일반 쓰레기이므로 재활용이 불가능합니다.',
      'correct': 'X',
    }.obs,
    {
      'image': 'asset/images/png/image_broken_glass.jpg',
      'title': '깨진 유리 조각은 일반 쓰레기로 버려야 한다.',
      'correct': 'O',
    }.obs,
    {
      'image': 'asset/images/png/image_wastebasket.jpg',
      'title': '부피가 큰 경우 대형 폐기물 신고 후 배출 수수료를 납부하고 배출해야 한다.',
      'correct': 'O',
    }.obs,
    {
      'image': 'asset/images/png/image_pot.jpg',
      'title': '식물은 일반쓰레기다.',
      'correct': 'O',
    }.obs,
  ].obs;

  @override
  void onInit() {
    randomIndex = List<int>.generate(5, (int index) => index);
    randomIndex.shuffle();
    super.onInit();
  }

  @override
  void onClose() {
    answerTimer.cancel();
    nextTimer.cancel();
    endTimer.cancel();
    super.onClose();
  }

  void onAnswerTimer() {
    answerTimer = Timer(const Duration(seconds: 1), () {
      showAnswer.value = true;
    });
  }

  void nextProblem() {
    nextTimer = Timer(const Duration(seconds: 2), () {
      currentProblemNum.value ++;
      checkClick.value = false;
      showAnswer.value = false;
      correct.value = false;
    });
  }

  void onEndTimer(void Function() callback) {
    endTimer = Timer(const Duration(seconds: 2), callback);
  }

  void getPoint(int index) {
    if (totalPoint.value < randomIndex.length) totalPoint.value += index;
  }
}