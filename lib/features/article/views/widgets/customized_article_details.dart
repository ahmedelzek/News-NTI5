import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_nti5/core/customized_widgets/customized_publisher_header.dart';

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
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 16.h),
                CustomizedPublisherHeader(),
                SizedBox(height: 24.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      Texts.articleText,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
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
