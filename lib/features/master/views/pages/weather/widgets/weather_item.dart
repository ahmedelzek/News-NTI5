import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_nti5/core/resources/app_assets.dart';

import '../../../../../../core/resources/app_colors.dart';

class WeatherItem extends StatelessWidget {
  final String icon;
  final String title;
  final String detail;

  const WeatherItem({
    super.key,
    required this.icon,
    required this.title,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon, height: 45.h, width: 45.w),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
                color: AppColors.blue,
              ),
            ),
            SizedBox(height: 8),
            Text(
              detail,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp),
            ),
          ],
        ),
      ],
    );
  }
}
