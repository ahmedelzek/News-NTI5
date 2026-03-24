import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/app_router/app_router.dart';
import 'core/resources/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      child: MaterialApp.router(
        title: 'News',
        theme: AppTheme.lightTheme,
        routerConfig: appRouter,
      ),
    );
  }
}