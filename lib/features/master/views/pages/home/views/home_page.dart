import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_nti5/core/app_router/app_router_keys.dart';
import 'package:news_nti5/features/master/views/pages/home/cubit/home_cubit.dart';
import 'package:news_nti5/features/master/views/pages/home/views/widgets/customized_news_list_item.dart';
import 'package:news_nti5/features/master/views/pages/home/views/widgets/customized_slideable_card.dart';
import 'package:news_nti5/features/master/views/pages/home/views/widgets/most_populer_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../core/resources/app_colors.dart';
import '../../../widgets/customized_app_bar.dart';
import '../cubit/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);

          if (state is HomeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is HomeErrorState) {
            return Center(child: Text(state.error));
          }
          return Scaffold(
            body: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 59.h,
                  color: AppColors.paleIceBlue,
                ),
                CustomizedAppBar(),
                SizedBox(height: 16.h),
                SizedBox(
                  height: 275.h,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: cubit.topHeadlines?.articles?.length ?? 0,
                    itemBuilder: (context, index) {
                      var article = cubit.topHeadlines!.articles![index];
                      return CustomizedSlideableCard(
                        title: article.title ?? "",
                        author: article.author ?? "Unknown",
                        imagePath: article.urlToImage,
                      );
                    },
                  ),
                ),
                SizedBox(height: 15.h),
                SmoothPageIndicator(
                  controller: _pageController,
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
                      var article = cubit.news!.articles![index];
                      return InkWell(
                        onTap: () {
                          context.push(AppRouterPaths.article);
                        },
                        child: CustomizedNewsListItem(
                          title: article.title ?? "",
                          category: article.source?.name ?? "",
                          imagePath: article.urlToImage,
                        ),
                      );
                    },
                    itemCount: 10,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
