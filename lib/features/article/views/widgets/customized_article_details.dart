import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/texts.dart';
import 'customized_article_details_header.dart';

class CustomizedArticleDetails extends StatelessWidget {
  const CustomizedArticleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomizedArticleDetailsHeader(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 26.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "See How the Forest is Helping Our World",
                  style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    ClipOval(child: Image.asset(AppImages.image_1, height: 24.h, width: 24.w)),
                    SizedBox(width: 16.w),
                    Text("Harry Harper · Apr 12, 2023"),
                  ],
                ),
                SizedBox(height: 24.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      Texts.articleText,
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
