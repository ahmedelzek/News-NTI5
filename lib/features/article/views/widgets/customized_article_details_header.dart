import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_nti5/core/resources/app_assets.dart';
import 'package:news_nti5/core/resources/app_colors.dart';

class CustomizedArticleDetailsHeader extends StatelessWidget {
  const CustomizedArticleDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 16.h),
      height: 68.h,
      decoration: BoxDecoration(
        color: AppColors.lightBeige,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        )
      ),
      child: Row(
        children: [
            SvgPicture.asset(AppIcons.arrowBackIcon),
            Spacer(),
            SvgPicture.asset(AppIcons.archiveIcon),
            SizedBox(width: 28.w),
            SvgPicture.asset(AppIcons.shareIcon),
        ],
      ),
    );
  }
}
