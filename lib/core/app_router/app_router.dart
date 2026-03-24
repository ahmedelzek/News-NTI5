import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:news_nti5/core/app_router/app_router_keys.dart';
import 'package:news_nti5/features/home/home_screen.dart';
import 'package:news_nti5/features/onboarding/onboarding_screen.dart';

import '../../features/map/map_screen.dart';
import '../../features/splash/splash_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GoRouter appRouter = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: AppRouterPaths.map,
  routes: [
    GoRoute(
      path: AppRouterPaths.onboarding,
      builder: (context, state) => OnboardingScreen(),
    ),
    GoRoute(
      path: AppRouterPaths.splash,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: AppRouterPaths.home,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: AppRouterPaths.map,
      builder: (context, state) => MapScreen(),
    ),
  ],
);