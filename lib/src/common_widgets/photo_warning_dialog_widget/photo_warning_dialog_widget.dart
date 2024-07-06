
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bely2/src/common_widgets/photo_warning_dialog_widget/widgets/photo_warning_dropdown_widget/photo_warning_dropdown_widget.dart';
import 'package:bely2/src/features/controllers/photo_tap_screen_controllers/photo_tab_controller/photo_tab_controller.dart';
import 'package:bely2/src/utils/theme/text_theme.dart';

class PhotoWarningDialogWidget extends StatelessWidget {
  const PhotoWarningDialogWidget({
    required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final photoTabController = Get.find<PhotoTabController>();

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 155.h),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.h),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Text('경고하기', style: Theme.of(context).textTheme.nanum.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 23.sp,
                    height: 1.0,
                  )
                ),
                SizedBox(height: 50.h),
                const PhotoWarningDropdownWidget(),
                SizedBox(height: 40.h),
                Text('경고하시겠습니까?', style: Theme.of(context).textTheme.nanum.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    height: 1.0,
                  )
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        photoTabController.addWarning(index);
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 115.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.5.w),
                          borderRadius: BorderRadius.circular(20.r),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text('YES', style: Theme.of(context).textTheme.cafe24.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp,
                              height: 1.0,
                            )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),
                    InkWell(
                      onTap: () { Navigator.pop(context); },
                      child: Container(
                        width: 115.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: Colors.black,
                        ),
                        child: Center(
                          child: Text('NO', style: Theme.of(context).textTheme.cafe24.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp,
                              height: 1.0,
                            )
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}
