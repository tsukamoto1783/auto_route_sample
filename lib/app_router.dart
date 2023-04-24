import 'package:auto_route/auto_route.dart';
import 'package:auto_route_sample/dashboard.dart';
import 'package:auto_route_sample/tabs/details_page.dart';
import 'package:auto_route_sample/tabs/home_page.dart';
import 'package:auto_route_sample/tabs/posts_page.dart';
import 'package:auto_route_sample/tabs/settings_page.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/dashboard',
          initial: true,
          page: DashboardRoute.page,
          children: [
            AutoRoute(path: 'home', page: HomeRoute.page, initial: true),
            AutoRoute(path: 'posts', page: PostsRoute.page),
            AutoRoute(
              path: 'setting',
              page: SettingsRouterRoute.page,
              children: [
                AutoRoute(initial: true, page: SettingsRoute.page),
                AutoRoute(path: 'details', page: DetailsRoute.page),
              ],
            ),
          ],
        ),
      ];
}
