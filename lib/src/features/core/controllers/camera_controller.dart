
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bely2/src/features/controllers/photo_tap_screen_controllers/photo_tab_controller/photo_tab_controller.dart';
import 'package:bely2/src/features/controllers/point_screen_controllers/point_controller/point_controller.dart';

import '../../models/photo_auth_model.dart';

class CameraController extends GetxController {

  Future getImage(ImageSource imageSource) async {
    DateTime currentTime = DateTime.now();
    String timeText = DateFormat('yyyy.MM.dd').format(currentTime);
    final pointController = Get.find<PointController>();
    final photoTabController = Get.find<PhotoTabController>();
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: imageSource);

    if (image != null) {
      pointController.getPhotoPoint();
      photoTabController.photo.add(
        PhotoAuthModel(
          imageFile: FileImage(File(image.path.toString())).obs,
          me: true.obs,
          writer: '나'.obs,
          date: timeText.obs,
          warning: 0.obs,
          like: 0.obs,
        ),
      );
    }
  }
}