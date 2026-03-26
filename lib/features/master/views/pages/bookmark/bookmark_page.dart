import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_nti5/features/master/views/pages/bookmark/widgets/bookmark_app_bar.dart';
import 'package:news_nti5/features/master/views/pages/bookmark/widgets/customized_bookmark_article_item.dart';


class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bookmarkAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return CustomizedBookmarkArticleItem();
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
