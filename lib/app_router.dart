import 'package:auto_route/auto_route.dart';
import 'package:auto_route_sample/home_page.dart';
import 'package:auto_route_sample/user_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: UserRoute.page, path: "/user-page"),
      ];
}
