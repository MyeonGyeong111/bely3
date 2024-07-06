
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bely2/src/utils/theme/text_theme.dart';

class AuthStateAppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AuthStateAppbarWidget({super.key});

  @override
  Size get preferredSize => Size.fromHeight(84.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 84.h,
      elevation: 0.0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      centerTitle: true,
      leadingWidth: 55.w,
      leading: Row(
        children: [
          SizedBox(width: 24.w),
          InkWell(
            onTap: (){ Navigator.pop(context); },
            child: Icon(Icons.arrow_back, size: 30.sp),
          )
        ],
      ),
      title: Text('참가자 인증현황', style: Theme.of(context).textTheme.nanum.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 20.sp,
          height: 1.0,
        )
      ),
    );
  }
}