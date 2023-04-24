import 'package:auto_route/auto_route.dart';
import 'package:auto_route_sample/dashboard.dart';
import 'package:auto_route_sample/tabs/details/details1_page.dart';
import 'package:auto_route_sample/tabs/details/details2_page.dart';
import 'package:auto_route_sample/tabs/details/details3_page.dart';
import 'package:auto_route_sample/tabs/details/page_stack/stack1_page.dart';
import 'package:auto_route_sample/tabs/details/page_stack/stack2_page.dart';
import 'package:auto_route_sample/tabs/details/page_stack/stack3_page.dart';
import 'package:auto_route_sample/tabs/details/page_stack/stack4_page.dart';
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
            AutoRoute(
              path: 'posts',
              // ボトムナビゲージョンバーに設定したrouterに関して、AutoRouterかますのは、使い回しできなそう。
              // 以下だとエラーになる。
              // page: SettingsRouterRoute.page,
              page: PostsRouterRoute.page,
              children: [
                AutoRoute(initial: true, page: PostsRoute.page),
                AutoRoute(path: 'details', page: Details1Route.page),
              ],
            ),
            AutoRoute(
              path: 'setting',
              page: SettingsRouterRoute.page,
              children: [
                AutoRoute(initial: true, page: SettingsRoute.page),
                AutoRoute(path: 'details-1', page: Details1Route.page),

                // childrenでネストしていくパターン
                AutoRoute(
                    path: 'details-2',
                    page: Details2Route.page,
                    children: [
                      AutoRoute(path: 'details-1', page: Details1Route.page),
                      AutoRoute(path: 'details-2', page: Details2Route.page)
                    ]),

                // path指定でネストしていくパターン
                // どっちが可読性良くなるかは要検討。
                AutoRoute(path: 'details-3', page: Details3Route.page),
                AutoRoute(path: 'details-3/stack-1', page: Stack1Route.page),
                AutoRoute(
                    path: 'details-3/stack-1/stack-2', page: Stack2Route.page),
                AutoRoute(
                    path: 'details-3/stack-1/stack-2/stack-3',
                    page: Stack3Route.page),
                AutoRoute(
                    path: 'details-3/stack-1/stack-2/stack-3/stack-4',
                    page: Stack4Route.page),
              ],
            ),
          ],
        ),
      ];
}
