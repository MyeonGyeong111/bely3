
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bely2/src/utils/theme/text_theme.dart';
import '../../../../../common_widgets/photo_example_dialog_widget/photo_example_dialog_widget.dart';

class PhotoTapAuthExWidget extends StatelessWidget {
  const PhotoTapAuthExWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 5.w),
      height: 35.h,
      alignment: Alignment.centerLeft,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('인증 방법 및 인증샷 예시', style: Theme.of(context).textTheme.nanum.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
            height: 1.0,
          )
          ),
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => const PhotoExampleDialogWidget());
            },
            child: Icon(Icons.arrow_right, size: 35.sp),
          ),
        ],
      ),
    );
  }
}