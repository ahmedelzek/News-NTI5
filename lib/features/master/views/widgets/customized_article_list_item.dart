import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/customized_widgets/customized_publisher_header.dart';
import '../../../../core/resources/app_assets.dart';

class CustomizedArticleListItem extends StatelessWidget {
  const CustomizedArticleListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Experience the Serenity of Japan's Traditional Countryside",
                  style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                CustomizedPublisherHeader(),
              ],
            ),
          ),
          SizedBox(width: 16,),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              AppImages.image_1,
              width: 112.w,
              height: 80.h,
              fit: BoxFit.cover,)
          )
        ],
      ),
    );
  }
}
