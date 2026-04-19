import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_nti5/features/master/views/pages/bookmark/bookmark_page.dart';
import 'package:news_nti5/features/master/views/pages/home/views/home_page.dart';
import 'package:news_nti5/features/master/views/pages/weather/weather_page.dart';

import '../../../../core/resources/app_colors.dart';
import '../pages/explore/explore_page.dart';

List<BottomNavigationBarItem> generateBottomNavItems(
  Map<String, String> iconMap,
) {
  return iconMap.entries
      .map(
        (entry) => BottomNavigationBarItem(
          icon: SvgPicture.asset(
            entry.key,
            colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
          ),
          activeIcon: Container(
            padding: EdgeInsets.symmetric(vertical: 4.h),
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            width: null,
            height: 48.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  entry.key,
                  colorFilter: ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: 5.w),
                Text(
                  entry.value,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          label: entry.value,
        ),
      )
      .toList();
}

List<Widget> taps = [
  const HomePage(),
  const ExplorePage(),
  const BookmarkPage(),
  const WeatherPage(),
];
