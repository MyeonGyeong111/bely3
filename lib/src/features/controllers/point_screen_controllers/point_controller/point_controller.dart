
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PointController extends GetxController{
  RxList photoPoint = [11, 1, 10, 100].obs;
  RxInt quizPoint = 50.obs;
  late RxInt total;

  @override
  void onInit() {
    total = 0.obs;
    total.value = photoPoint[3] + quizPoint.value;
    super.onInit();
  }

  void getPhotoPoint() {
    photoPoint[0] += 1;
    photoPoint[2] += 1;
    photoPoint[3] += 10;
    total.value += 10;
  }

  void getQuizPoint(int point) {
    quizPoint.value += point;
    total.value += point;
  }
}