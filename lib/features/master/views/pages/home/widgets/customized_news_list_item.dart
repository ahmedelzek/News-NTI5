import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_nti5/core/resources/app_assets.dart';

class CustomizedNewsListItem extends StatelessWidget {
  const CustomizedNewsListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      width: 240.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(
              AppImages.image_1,
              fit: BoxFit.cover,
              width: 240.w,
              height: 232.h,
            ),
          ),
          Text(
            "The Pros and Cons of Remote Work",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
          ),
          Text(
            "Technology",
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
