
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bely2/src/common_widgets/photo_warning_dialog_widget/photo_warning_dialog_widget.dart';
import 'package:bely2/src/constants/colors.dart';
import 'package:bely2/src/features/controllers/photo_tap_screen_controllers/photo_tab_controller/photo_tab_controller.dart';
import 'package:bely2/src/features/screens/auth_state_screen/widgets/auth_state_appbar_widget/auth_state_appbar_widget.dart';
import 'package:bely2/src/utils/theme/text_theme.dart';

class AuthStateScreen extends StatelessWidget {
  const AuthStateScreen({
    required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final photoTabController = Get.find<PhotoTabController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AuthStateAppbarWidget(),
      body: Column(
        children: [
          Divider(height: 2.h, color: tBorderColor3),
          Container(
            padding: EdgeInsets.only(left: 24.w),
            height: 58.h,
            child: Row(
              children: [
                Container(
                  width: 35.w,
                  height: 35.h,
                  decoration: const BoxDecoration(
                    color: tTabColor2,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 12.w),
                Text('${photoTabController.photo[index].writer.value}'
                    "\n"
                    '${photoTabController.photo[index].date.value}', style: Theme.of(context).textTheme.nanum.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp,
                    height: 1.3,
                  )
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 318.h,
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
                  ) : Container();
                }),
              ],
            ),
          ),
          Obx(() {
            return Container(
              padding: EdgeInsets.only(left: 10.w, right: 8.w),
              height: 46.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: () { photoTabController.addLIke(index); },
                        child: Text(photoTabController.photo[index].like.value == 0 ? '좋아요' : '좋아요${photoTabController.photo[index].like.value}', style: Theme.of(context).textTheme.nanum.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp,
                            height: 1.0,
                          )
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('댓글', style: Theme.of(context).textTheme.nanum.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp,
                            height: 1.0,
                          )
                        ),
                      )
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => PhotoWarningDialogWidget(index: index));
                    },
                    child: Text(photoTabController.photo[index].warning.value == 0 ? '경고하기' : '경고${photoTabController.photo[index].warning.value}', style: Theme.of(context).textTheme.nanum.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                      height: 1.0,
                    )
                    ),
                  ),
                ],
              ),
            );
          }),
          Divider(height: 2.h, color: tBorderColor3),
        ],
      ),
    );
  }
}
