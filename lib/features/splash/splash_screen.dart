import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/app_router/app_router_keys.dart';
import '../../core/resources/app_assets.dart';
import '../../core/resources/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(milliseconds: 1500,), () {
      context.go(AppRouterPaths.onboarding);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.paleIceBlue,
      body: Center(
        child: Image.asset(
          AppImages.logo,
          width: 176.w,
          height: 50.h,
        ),
      ),
    );
  }
}
