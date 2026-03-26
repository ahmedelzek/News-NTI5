import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_nti5/core/demo_data/demo_data.dart';
import 'package:news_nti5/features/master/views/pages/explore/widgets/custom_explore_app_bar.dart';
import 'package:news_nti5/features/master/views/pages/explore/widgets/customized_article_list_item.dart';
import 'package:news_nti5/features/master/views/pages/explore/widgets/customized_tab_bar.dart';
import 'package:news_nti5/features/master/views/pages/explore/widgets/cutomized_main_article.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int categoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customizedExploreAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            DefaultTabController(
              length: DemoData.newsCategoryList.length,
              child: CustomizedTabBar(
                onTap: (int index) {
                  categoryIndex = index;
                },
              ),
            ),
            CustomizedMainArticle(),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return CustomizedArticleListItem();
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
