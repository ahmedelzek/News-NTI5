import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_nti5/core/app_router/app_router_keys.dart';
import 'package:news_nti5/features/master/views/pages/home/widgets/customized_home_app_bar.dart';
import 'package:news_nti5/features/master/views/pages/home/widgets/customized_news_list_item.dart';
import 'package:news_nti5/features/master/views/pages/home/widgets/customized_slideable_card.dart';
import 'package:news_nti5/features/master/views/pages/home/widgets/most_populer_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/resources/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final PageController pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 59.h,
            color: AppColors.paleIceBlue,
          ),
          CustomizedHomeAppBar(),
          SizedBox(height: 16.h),
          SizedBox(
            height: 275.h,
            child: PageView(
              controller: pageController,
              children: [
                CustomizedSlideableCard(),
                CustomizedSlideableCard(),
                CustomizedSlideableCard(),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          SmoothPageIndicator(
            controller: pageController,
            count: 3,
            effect: ScrollingDotsEffect(
              activeDotColor: AppColors.blue,
              dotColor: AppColors.grey,
              dotHeight: 9.h,
              dotWidth: 9.w,
            ),
          ),
          mostPopularText(),
          SizedBox(height: 16.h),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    context.push(AppRouterPaths.article);
                  },
                    child: CustomizedNewsListItem());
              },
              itemCount: 10,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
