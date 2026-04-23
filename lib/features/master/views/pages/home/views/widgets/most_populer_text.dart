import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/resources/app_colors.dart';

Widget mostPopularText() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 16.w),
    child: Row(
      children: [
        Text(
          "Most Popular",
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
        ),
        Spacer(),
        Text(
          "See More",
          style: TextStyle(
            color: AppColors.blue,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}
