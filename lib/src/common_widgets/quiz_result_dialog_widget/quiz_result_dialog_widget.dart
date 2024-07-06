
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bely2/src/utils/theme/text_theme.dart';

class QuizResultDialogWidget extends StatelessWidget {
  const QuizResultDialogWidget({
    required this.totalProblem,
    required this.point,
    super.key,
  });

  final int totalProblem;
  final int point;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 195.h),
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
                SizedBox(height: 40.h),
                Text('오늘의 Quiz 완료!', style: Theme.of(context).textTheme.nanum.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 23.sp,
                    height: 1.0,
                  )
                ),
                SizedBox(height: 30.h),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: '총 $totalProblem문제 중 ', style: Theme.of(context).textTheme.nanum.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 17.sp,
                          height: 1.0,
                        )
                      ),
                      TextSpan(text: '$point', style: Theme.of(context).textTheme.nanum.copyWith(
                          color: Colors.blue,
                          fontWeight: FontWeight.w800,
                          fontSize: 17.sp,
                          height: 1.0,
                        )
                      ),
                      TextSpan(text: '문제를 맞혀', style: Theme.of(context).textTheme.nanum.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 17.sp,
                          height: 1.0,
                        )
                      ),
                    ]
                  )
                ),
                SizedBox(height: 5.h),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: '$point포인트', style: Theme.of(context).textTheme.nanum.copyWith(
                          color: Colors.blue,
                          fontWeight: FontWeight.w800,
                          fontSize: 17.sp,
                          height: 1.0,
                        )
                      ),
                      TextSpan(text: '를 획득하셨습니다!', style: Theme.of(context).textTheme.nanum.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 17.sp,
                          height: 1.0,
                        )
                      ),
                    ]
                  )
                ),
                SizedBox(height: 30.h),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 120.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.green,
                    ),
                    child: Center(
                      child: Text('확인', style: Theme.of(context).textTheme.nanum.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                          height: 1.0,
                        )
                      ),
                    )
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
