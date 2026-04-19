import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:news_nti5/core/app_router/app_router_keys.dart';
import 'package:news_nti5/core/cache/cache_helper.dart';
import 'package:news_nti5/core/cache/cache_keys.dart';
import 'package:news_nti5/features/master/views/master_screen.dart';
import 'package:news_nti5/features/onboarding/onboarding_screen.dart';

import '../../features/article/views/article_screen.dart';
import '../../features/map/map_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GoRouter appRouter = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: AppRouterPaths.onboarding,
  routes: [
    GoRoute(
      path: AppRouterPaths.onboarding,
      builder: (context, state) {
        bool isFirstTime = CacheHelper.getValue(CacheKeys.isFirstTime) ?? true;
        if (isFirstTime) {
          return OnboardingScreen();
        } else {
          return MasterScreen();
        }
      },
    ),
    GoRoute(
      path: AppRouterPaths.home,
      builder: (context, state) => MasterScreen(),
    ),
    GoRoute(path: AppRouterPaths.map, builder: (context, state) => MapScreen()),
    GoRoute(
      path: AppRouterPaths.article,
      builder: (context, state) => ArticleScreen(),
    ),
  ],
);
