import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/app_colors.dart';

PreferredSize customizedExploreAppBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(70.h),
    child: AppBar(
      actions: [
        Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: SvgPicture.asset(
                AppIcons.searchIcon, height: 24.h, width: 24.w))
      ],
      title: Container(
        margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
        child: Text(
          "Explore",
          style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w600),
        ),
      ),
      centerTitle: false,
      backgroundColor: AppColors.paleIceBlue,
    ),
  );
}