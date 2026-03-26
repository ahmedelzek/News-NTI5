import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/app_colors.dart';

Widget tabItem({required String title}) {
  return Tab(
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.paleIceBlue, width: 2.r),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14.sp,
        ),
      ),
    ),
  );
}