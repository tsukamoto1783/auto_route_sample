// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    SettingDefoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingDefoPage(),
      );
    },
    SettingRoute.name: (routeData) {
      final args = routeData.argsAs<SettingRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SettingPage(
          key: args.key,
          name: args.name,
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardPage(),
      );
    },
    PostsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PostsPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    UsersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UsersPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
  };
}

/// generated route for
/// [SettingDefoPage]
class SettingDefoRoute extends PageRouteInfo<void> {
  const SettingDefoRoute({List<PageRouteInfo>? children})
      : super(
          SettingDefoRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingDefoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingPage]
class SettingRoute extends PageRouteInfo<SettingRouteArgs> {
  SettingRoute({
    Key? key,
    required String name,
    List<PageRouteInfo>? children,
  }) : super(
          SettingRoute.name,
          args: SettingRouteArgs(
            key: key,
            name: name,
          ),
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

  static const PageInfo<SettingRouteArgs> page =
      PageInfo<SettingRouteArgs>(name);
}

class SettingRouteArgs {
  const SettingRouteArgs({
    this.key,
    required this.name,
  });

  final Key? key;

  final String name;

  @override
  String toString() {
    return 'SettingRouteArgs{key: $key, name: $name}';
  }
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PostsPage]
class PostsRoute extends PageRouteInfo<void> {
  const PostsRoute({List<PageRouteInfo>? children})
      : super(
          PostsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UsersPage]
class UsersRoute extends PageRouteInfo<void> {
  const UsersRoute({List<PageRouteInfo>? children})
      : super(
          UsersRoute.name,
          initialChildren: children,
        );

  static const String name = 'UsersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
