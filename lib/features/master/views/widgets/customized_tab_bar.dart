import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/demo_data/demo_data.dart';
import '../../../../core/resources/app_colors.dart';
import 'customized_tab_item.dart';

class CustomizedTabBar extends StatefulWidget {

  final Function(int index) onTap;
  const CustomizedTabBar({super.key , required this.onTap});

  @override
  State<CustomizedTabBar> createState() => _CustomizedTabBarState();
}

class _CustomizedTabBarState extends State<CustomizedTabBar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelPadding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 8.h,
      ),
      indicatorPadding: EdgeInsets.symmetric(vertical: 8.h),
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      unselectedLabelColor: AppColors.black,
      labelColor: AppColors.black,
      dividerHeight: 0,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.paleIceBlue,
      ),
      tabs:
      DemoData.newsCategoryList
          .map((category) => tabItem(title: category))
          .toList(),
      onTap: widget.onTap,
    );
  }
}
