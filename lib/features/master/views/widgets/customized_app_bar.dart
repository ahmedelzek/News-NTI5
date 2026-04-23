import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/app_colors.dart';

class CustomizedAppBar extends StatelessWidget {
  final String degree;
  final String title;
  final String? iconPath;
  const CustomizedAppBar({super.key, required this.title, required this.degree, this.iconPath});

  String get _greeting {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }

  String get _currentDate {
    return DateFormat('EEE d MMMM, yyyy').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 83.h,
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 5.h),
      decoration: BoxDecoration(color: AppColors.paleIceBlue),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$_greeting,\nAhmed Adel",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                _currentDate,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Spacer(),
          Image.asset(AppImages.sunImage, width: 32.w, height: 32.h),
          SizedBox(width: 8.w),
          Text(
            "$title $degree",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
