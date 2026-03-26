import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_nti5/core/customized_widgets/customized_button.dart';
import 'package:news_nti5/core/resources/app_assets.dart';
import 'package:news_nti5/features/master/views/pages/weather/widgets/weather_block.dart';
import 'package:news_nti5/features/master/views/pages/weather/widgets/weather_block_details.dart';
import 'package:news_nti5/features/master/views/widgets/customized_app_bar.dart';

import '../../../../../core/resources/app_colors.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 59.h,
            color: AppColors.white,
          ),
          CustomizedAppBar(),
          SizedBox(height: 16.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 32.w),
            child: WeatherBlock(),
          ),
          SizedBox(height: 16.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 45.w),
            child: WeatherBlockDetails(),
          ),
          SizedBox(height: 82.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 62.w),
            child: CustomizedButton(
              text: "Change Location",
              icon: AppIcons.locationIcon,
            ),
          ),
        ],
      ),
    );
  }
}
