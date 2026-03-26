import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_nti5/core/customized_widgets/customized_publisher_header.dart';

import '../../../../../../core/resources/app_assets.dart';

class CustomizedMainArticle extends StatefulWidget {
  const CustomizedMainArticle({super.key});

  @override
  State<CustomizedMainArticle> createState() => _CustomizedMainArticleState();
}

class _CustomizedMainArticleState extends State<CustomizedMainArticle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          child: Image.asset(
            AppImages.image_1,
            width: double.infinity,
            height: 206.h,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          "Uncovering the Hidden Gems of the Amazon Forest",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12.h),
        CustomizedPublisherHeader(),
      ],
    );
  }
}
