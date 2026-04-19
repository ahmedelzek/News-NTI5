import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_nti5/core/resources/app_assets.dart';

class CustomizedNewsListItem extends StatelessWidget {
  final String title;
  final String category;
  final String? imagePath;

  const CustomizedNewsListItem({
    super.key,
    required this.title,
    required this.category,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      width: 240.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child:
                imagePath != null
                    ? Image.network(
                      imagePath!,
                      fit: BoxFit.cover,
                      width: 240.w,
                      height: 232.h,
                    )
                    : Image.asset(
                      AppImages.image_2,
                      fit: BoxFit.cover,
                      width: 240.w,
                      height: 232.h,
                    ),
          ),
          Expanded(
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            category,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 5.h,)
        ],
      ),
    );
  }
}
