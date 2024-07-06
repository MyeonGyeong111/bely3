
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bely2/src/constants/colors.dart';
import 'package:bely2/src/utils/theme/text_theme.dart';

class PhotoExampleDialogWidget extends StatelessWidget {
  const PhotoExampleDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 135.h),
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
                SizedBox(height: 5.h),
                Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: (){ Navigator.pop(context); },
                      child: Container(
                        width: 33.w,
                        height: 33.h,
                        decoration: const BoxDecoration(
                          color: tIconColor2,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.close, size: 23.sp),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Text('인증 방법 및 인증샷 예시', style: Theme.of(context).textTheme.nanum.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 23.sp,
                    height: 1.0,
                  )
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: Image.asset(
                            'asset/images/png/image_recycle_example.jpg',
                            width: 80.w,
                            height: 80.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text("옳은 예시", style: Theme.of(context).textTheme.nanum.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                            height: 1.0,
                          )
                        ),
                      ],
                    ),
                    SizedBox(width: 20.w),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: Image.asset(
                            'asset/images/png/image_recycle_example2.jpg',
                            width: 80.w,
                            height: 80.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text("틀린 예시", style: Theme.of(context).textTheme.nanum.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                            height: 1.0,
                          )
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 40.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('하루에 한 번만 인증이 가능합니다.', style: Theme.of(context).textTheme.nanum.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                        height: 1.0,
                      )
                      ),
                      SizedBox(height: 20.h),
                      Text('내용물이 있는 쓰레기는 깨끗하게 헹구고, 부착물을 제거한 후 분리배출 해주세요.', style: Theme.of(context).textTheme.nanum.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                          height: 1.0,
                        )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}
