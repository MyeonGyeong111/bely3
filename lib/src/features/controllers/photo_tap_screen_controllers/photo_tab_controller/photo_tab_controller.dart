
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../models/photo_auth_model.dart';

class PhotoTabController extends GetxController with GetSingleTickerProviderStateMixin {
  RxInt tabNum = 0.obs;
  RxList<PhotoAuthModel> photo = [
    PhotoAuthModel(
      image: 'asset/images/png/image_photo.jpg'.obs,
      me: false.obs,
      writer: '닉네임'.obs,
      date: '2024.05.17'.obs,
      warning: 3.obs,
      like: 0.obs,
    ),
    PhotoAuthModel(
      image: 'asset/images/png/image_photo2.jpg'.obs,
      me: false.obs,
      writer: '닉네임'.obs,
      date: '2024.05.17'.obs,
      warning: 0.obs,
      like: 0.obs,
    ),
    PhotoAuthModel(
      image: 'asset/images/png/image_photo3.jpg'.obs,
      me: false.obs,
      writer: '닉네임'.obs,
      date: '2024.05.17'.obs,
      warning: 0.obs,
      like: 0.obs,
    ),
    PhotoAuthModel(
      image: 'asset/images/png/image_photo4.jpg'.obs,
      me: false.obs,
      writer: '닉네임'.obs,
      date: '2024.05.17'.obs,
      warning: 0.obs,
      like: 0.obs,
    ),
    PhotoAuthModel(
      image: 'asset/images/png/image_photo5.jpg'.obs,
      me: true.obs,
      writer: '나'.obs,
      date: '2024.05.17'.obs,
      warning: 0.obs,
      like: 0.obs,
    ),
  ].obs;

  final List<Tab> myTabs = <Tab>[
    const Tab(text: '나의 인증현황'),
    const Tab(text: '참가자 인증현황'),
  ];

  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: myTabs.length, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void onItemTapped(int index) {
    tabNum.value = index;
  }

  void addWarning(int index) {
    if (photo[index].warning.value < 3) photo[index].warning.value += 1;
  }

  void addLIke(int index) {
    photo[index].like.value += 1;
  }
}