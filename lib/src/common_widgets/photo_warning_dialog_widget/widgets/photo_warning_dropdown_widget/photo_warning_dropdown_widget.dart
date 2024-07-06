
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bely2/src/utils/theme/text_theme.dart';

class PhotoWarningDropdownWidget extends StatefulWidget {
  const PhotoWarningDropdownWidget({super.key});

  @override
  State<PhotoWarningDropdownWidget> createState() => _PhotoWarningDropdownWidgetState();
}

class _PhotoWarningDropdownWidgetState extends State<PhotoWarningDropdownWidget> {
  final List<String> warningItems = [
    '올바른 분리배출이 아닙니다.',
    '분리수거장에서 찍었는지 확인할 수 없습니다.',
    '이전 사진과 중복됩니다.',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 20.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        hint: Text(
          '경고 사유를 선택하세요',
          style: Theme.of(context).textTheme.nanum.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 15.sp,
            height: 1.0,
          )
        ),
        items: warningItems.map((item) => DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: Theme.of(context).textTheme.nanum.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 15.sp,
              height: 1.0,
            ),
            overflow: TextOverflow.visible,
          ),
        )).toList(),
        onChanged: (value) { },
        buttonStyleData: ButtonStyleData(
          padding: EdgeInsets.only(right: 8.w),
        ),
        iconStyleData: IconStyleData(
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.black45,
          ),
          iconSize: 24.sp,
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: 50.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
        ),
      ),
    );
  }
}
