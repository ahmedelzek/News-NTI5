import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_nti5/core/resources/app_assets.dart';
import 'package:news_nti5/core/resources/app_colors.dart';

class CustomizedNameContainer extends StatelessWidget {
  const CustomizedNameContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(color: AppColors.grey),
      child: Row(
        children: [
          SvgPicture.asset(AppIcons.profileIcon, width: 24.w, height: 24.h),
          SizedBox(width: 12.w),
          Text(
            "Ahmed Adel",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
