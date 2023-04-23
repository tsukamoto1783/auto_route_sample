import 'package:auto_route/auto_route.dart';
import 'package:auto_route_sample/dashboard.dart';
import 'package:auto_route_sample/home_page.dart';
import 'package:auto_route_sample/posts.dart';
import 'package:auto_route_sample/setting_page.dart';
import 'package:auto_route_sample/settings.dart';
import 'package:auto_route_sample/users.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

// replaceInRouteNameを指定することで、ジェネレート時に文字列を変換してくれる。
// HomePage -> HomeRoute
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        // 以下のドキュメントの記載だとエラーになる。
        // AutoRoute(HomeRoute.page),

        // 以下のように修正
        // initial: アプリ起動時の画面を設定しないと、"Can not resolve initial route"と怒られる。
        // page: requiredの名前付きコンストラクタなので、page:の記載が必要。
        AutoRoute(
          path: '/dashboardPage',
          initial: true,
          page: DashboardRoute.page,
          children: [
            AutoRoute(path: 'users', page: UsersRoute.page),
            AutoRoute(path: 'posts', page: PostsRoute.page, initial: true),
            AutoRoute(
              path: 'settings',
              page: SettingDefoRoute.page,
              children: [
                AutoRoute(initial: true, page: SettingsRoute.page),
                AutoRoute(path: 'setting', page: HomeRoute.page),
              ],
            ),
            // AutoRoute(path: 'setting', page: SettingRoute.page),
          ],
        ),
        // AutoRoute(path: '/setting', page: SettingRoute.page),

        // AutoRoute(path: '/login', page: LoginRoute.page),
      ];
}
