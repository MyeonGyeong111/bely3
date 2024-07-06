
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bely2/src/constants/colors.dart';
import 'package:bely2/src/utils/theme/text_theme.dart';

class PhotoTapAppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const PhotoTapAppbarWidget({super.key});

  @override
  Size get preferredSize => Size.fromHeight(147.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 87.h,
      elevation: 0.0,
      scrolledUnderElevation: 0,
      backgroundColor: tAppbarColor,
      automaticallyImplyLeading: false,
      leadingWidth: 70.w,
      leading: Row(
        children: [
          SizedBox(width: 28.w),
          InkWell(
            onTap: (){ Navigator.pop(context); },
            child: Container(
              width: 33.w,
              height: 33.h,
              decoration: const BoxDecoration(
                color: tIconColor2,
                shape: BoxShape.circle,
              ),
              child: Center(child: Icon(Icons.arrow_back, size: 23.sp)),
            ),
          )
        ],
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Container(
          padding: EdgeInsets.only(left: 13.w),
          alignment: Alignment.centerLeft,
          height: 60.h,
          child: Text('올바른 분리배출 실천하기!', style: Theme.of(context).textTheme.nanum.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 23.sp,
              height: 1.0,
            )
          ),
        )
      ),
    );
  }
}