import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/app_assets.dart';

class CustomizedPublisherHeader extends StatelessWidget {
  const CustomizedPublisherHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Image.asset(AppImages.image_1, height: 24.h, width: 24.w),
        ),
        SizedBox(width: 16.w),
        Text("Harry Harper · Apr 12, 2023"),
      ],
    );
  }
}
