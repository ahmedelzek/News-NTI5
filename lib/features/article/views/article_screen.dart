import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_nti5/core/resources/app_assets.dart';
import 'package:news_nti5/features/article/views/widgets/customized_article_details.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              AppImages.image_1,
              width: double.infinity,
              height: 316.h,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 271.h,
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomizedArticleDetails(),
          ),
        ],
      ),    );
  }
}
