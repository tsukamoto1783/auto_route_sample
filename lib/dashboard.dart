import 'package:auto_route/auto_route.dart';
import 'package:auto_route_sample/app_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        UsersRoute(),
        PostsRoute(),
        SettingsRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(label: 'Users', icon: Icon(Icons.person)),
            BottomNavigationBarItem(label: 'Posts', icon: Icon(Icons.post_add)),
            BottomNavigationBarItem(
                label: 'Settings', icon: Icon(Icons.settings)),
          ],
        );
      },
    );
  }
}
