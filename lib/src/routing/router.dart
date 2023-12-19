import 'package:auto_route/auto_route.dart';

import 'package:flutter/cupertino.dart';

import '../ui/applied/applied_jobs_page.dart';
import '../ui/auth/auth_page.dart';

import '../ui/home/home_page.dart';
import '../ui/jobs/jobs_list_page.dart';
import '../ui/main/main_page.dart';
import '../ui/no_internet/no_internet_screen.dart';
import '../ui/profile/profile_page.dart';
import '../ui/splash/splash_page.dart';

part 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: '/',
      page: SplashRoute.page,
    ),
    AutoRoute(
      path: '/auth',
      page: AuthRoute.page,
    ),
    AutoRoute(
      path: '/main',
      page: MainRoute.page,
      children: [
        AutoRoute(
          path: 'home',
          page: HomeRoute.page,
        ),
        AutoRoute(
          path: 'jobs-list',
          page: JobsListRoute.page,
        ),
        AutoRoute(
          path: 'applied-jobs',
          page: AppliedJobsRoute.page,
        ),
        AutoRoute(
          path: 'profile',
          page: ProfileRoute.page,
        ),
      ],
    ),
    AutoRoute(
      path: '/profile',
      page: ProfileRoute.page,
    ),
    AutoRoute(
      path: '/no-internet',
      page: NoInternetRoute.page,
    ),
  ];
}
