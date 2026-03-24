import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_nti5/core/app_router/app_router_keys.dart';
import 'package:news_nti5/core/customized_widgets/customized_button.dart';
import 'package:news_nti5/core/resources/app_assets.dart';
import 'package:news_nti5/core/resources/app_colors.dart';
import 'package:news_nti5/features/map/widgets/customized_name_contanier.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.white),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 34.h),
            child: CustomizedNameContainer(),
          ),
          SizedBox(height: 33.h),
          Expanded(
            child: Stack(
              children: [
                Image.asset(
                  AppImages.mapImage,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Positioned(
                  bottom: 50.h,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 132.w),
                      child: CustomizedButton(text: "Get Start", onTap: (){
                        context.go(AppRouterPaths.home);
                      },)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
