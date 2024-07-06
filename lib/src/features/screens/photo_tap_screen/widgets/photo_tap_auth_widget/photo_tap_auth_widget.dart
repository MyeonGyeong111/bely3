
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/photo_tap_screen_controllers/photo_tab_controller/photo_tab_controller.dart';
import '../../../auth_state_screen/auth_state_screen.dart';

class PhotoTapAuthWidget extends StatelessWidget {
  const PhotoTapAuthWidget({
    required this.condition,
    super.key,
  });

  final String condition;

  @override
  Widget build(BuildContext context) {
    final photoTabController = Get.find<PhotoTabController>();

    return Obx(() {
      return Align(
        alignment: Alignment.topLeft,
        child: Wrap(
          children: List.generate(photoTabController.photo.length, (index) {
            return condition == 'me' ? photoTabController.photo[index].me.value == true ? Obx(() {
              return InkWell(
                onTap: () {
                  Get.to(() => AuthStateScreen(index: index), transition: Transition.rightToLeft);
                },
                child: SizedBox(
                  width: 120.w,
                  height: 120.h,
                  child: Stack(
                    children: [
                      if (photoTabController.photo[index].image?.value != null) ... {
                        Image.asset(
                          photoTabController.photo[index].image!.value,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          fit: BoxFit.fill,
                        ),
                      } else ... {
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: photoTabController.photo[index].imageFile!.value, fit: BoxFit.fill),
                          ),
                        )
                      },
                      Obx(() {
                        return photoTabController.photo[index].warning.value >= 3 ? Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.red.withOpacity(0.5),
                        )
                            : Container();
                      }),
                    ],
                  ),
                ),
              );
            }) : Container() : Obx(() {
              return InkWell(
                onTap: () {
                  Get.to(() => AuthStateScreen(index: index), transition: Transition.rightToLeft);
                },
                child: SizedBox(
                  width: 120.w,
                  height: 120.h,
                  child: Stack(
                    children: [
                      if (photoTabController.photo[index].image?.value != null) ... {
                        Image.asset(
                          photoTabController.photo[index].image!.value,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          fit: BoxFit.fill,
                        ),
                      } else ... {
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: photoTabController.photo[index].imageFile!.value, fit: BoxFit.fill),
                          ),
                        )
                      },
                      Obx(() {
                        return photoTabController.photo[index].warning.value >= 3 ? Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.red.withOpacity(0.5),
                        )
                            : Container();
                      }),
                    ],
                  ),
                ),
              );
            });
          }).reversed.toList(),
        ),
      );
    });
  }
}