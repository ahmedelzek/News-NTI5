import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/resources/app_assets.dart';

class WeatherBlock extends StatelessWidget {
  final String? country;
  final String? town;
  final String? degree;
  final String? weatherTitle;
  final String? weatherDescription;
  final String? filsLike;

  const WeatherBlock({super.key, this.country,
    this.town,
    this.degree, this.filsLike, this.weatherDescription, this.weatherTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$town - $country",
              style: textStyleTitle(),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 16.h),
            Text(
              "$degree",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 48.sp),
            ),
            SizedBox(height: 31.h),
            Text("$weatherTitle-$weatherDescription", style: textStyleTitle()),
            SizedBox(height: 8.h),
            Text("Feels like $filsLike", style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),),
          ],
        ),
        Spacer(),
        SvgPicture.asset(AppIcons.sunriseIcon, height: 50.h, width: 50.w),
      ],
    );
  }

  TextStyle textStyleTitle() {
    return TextStyle(fontWeight: FontWeight.w500, fontSize: 32.sp);
  }
}
