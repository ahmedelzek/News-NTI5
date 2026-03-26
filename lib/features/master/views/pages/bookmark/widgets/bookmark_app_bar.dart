import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/app_colors.dart';

PreferredSize bookmarkAppBar() {
  return  PreferredSize(
    preferredSize: Size.fromHeight(70.h),
    child: AppBar(
      backgroundColor: AppColors.paleIceBlue,
      title: Container(
        margin: EdgeInsets.symmetric(vertical: 16.h),
        child: Text(
          "Bookmark",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 32.sp),
        ),
      ),
    ),
  );
}