import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/resources/app_assets.dart';

class WeatherBlock extends StatelessWidget {
  const WeatherBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Cairo - EG",
              style: textStyleTitle(),
            ),
            SizedBox(height: 16.h),
            Text(
              "27",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 48.sp),
            ),
            SizedBox(height: 31.h),
            Text("Clear - Clear Sky", style: textStyleTitle()),
            SizedBox(height: 8.h),
            Text("Feels like 28", style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),),
          ],
        ),
        Spacer(),
        SvgPicture.asset(AppIcons.sunriseIcon, height: 76.h, width: 76.w),
      ],
    );
  }

  TextStyle textStyleTitle() {
    return TextStyle(fontWeight: FontWeight.w500, fontSize: 32.sp);
  }
}
