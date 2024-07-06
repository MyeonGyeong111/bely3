
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bely2/src/utils/theme/text_theme.dart';
import '../../constants/colors.dart';

class CommonBtnWidget extends StatelessWidget {
  const CommonBtnWidget({
    required this.title,
    required this.onTap,
    super.key,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 134.w,
        height: 23.h,
        decoration: BoxDecoration(
          border: Border.all(width: 1.w, color: tBorderColor2),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Center(
          child: Text(title, style: Theme.of(context).textTheme.nanum.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 13.sp,
              height: 1.0,
            )
          ),
        ),
      ),
    );
  }
}