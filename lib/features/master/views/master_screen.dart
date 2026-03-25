import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_nti5/features/master/views/widgets/bottom_nav_bar.dart';

import '../../../core/resources/app_assets.dart';
import '../../../core/resources/app_colors.dart';

class MasterScreen extends StatefulWidget {
  const MasterScreen({super.key});

  @override
  State<MasterScreen> createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {
  int selectedIndex = 0;

  get changeTab => (int index) {
    setState(() {
      selectedIndex = index;
    });
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: taps[selectedIndex],
        bottomNavigationBar: ClipRRect(
            borderRadius:  BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            iconSize: 32.r,
            onTap: changeTab,
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            backgroundColor: AppColors.bottomNavBarColor,
            items: generateBottomNavItems({
              AppIcons.homeIcon: "Home",
              AppIcons.earthIcon: "Explore",
              AppIcons.bookmarkIcon: "Bookmark",
              AppIcons.weatherIcon: "Weather",
            }),
          ),
        ));
  }
}