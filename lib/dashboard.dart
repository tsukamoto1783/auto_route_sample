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
        HomeRoute(),
        PostsRouterRoute(),
        SettingsRouterRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: (int index) {
            // 選択中じゃない別のタブをTapした時
            if (tabsRouter.activeIndex != index) {
              tabsRouter.setActiveIndex(index);
            }
            // 選択中のタブをTapした場合
            else {
              // 子ルーターのスタック情報を破棄
              tabsRouter
                  .innerRouterOf<StackRouter>(tabsRouter.current.name)
                  ?.popUntilRoot();

              /// NOTE: StackRouterクラスやTabsRouterクラスは、RoutingControllerクラスをextendsしてる
              // OK)
              // tabsRouter
              //     .innerRouterOf<StackRouter>(tabsRouter.current.name)
              //     ?.popUntilRoot();

              // error) RoutingControllerクラスにはpopUntilRoot()は無いと怒られる。
              // tabsRouter
              //     .innerRouterOf(tabsRouter.current.name)
              //     ?.popUntilRoot();

              // error) TabsRouterクラスにはpopUntilRoot()は無いと怒られる。
              // tabsRouter
              //     .innerRouterOf<TabsRouter>(tabsRouter.current.name)
              //     ?.popUntilRoot();

              // error) 一見同じ処理をしてそうだけど、型がRoutingControllerなのでpopUntilRoot()は無いと怒られる。
              // innerRouterOf:    T? innerRouterOf<T extends RoutingController>(String routeName) {
              // childControllers: List<RoutingController> get childControllers => _childControllers;
              // tabsRouter.childControllers[index].popUntilRoot();

              // ============== メモ ==================
              // context.routerは、操作してる画面のルーター情報を取得できる。
              // ここだと、context.routerは、DashboardPageのルーター情報のみ。
              debugPrint('========== context.router ===========');
              print(context.router.childControllers);
              print(context.router.stack);
              print(context.router.current.name);
              print(context.router.parent());

              // tabsRouterは、現在のタブのルーター情報を取得できる。
              // AutoTabsScaffold内でのみtabsRouterは使用できるので、各タブのルーター情報を取得できる。
              // childControllersも、innerRouterOfも、ルーター情報を取得できる。
              // スタック操作をする場合はinnerRouterOfを使う。innerRouterOfだとStackRouter型を指定できるため。
              debugPrint('========== tabsRouter.childControllers ===========');
              print(tabsRouter.childControllers);
              print(tabsRouter.childControllers[1].stack);
              print(tabsRouter.childControllers[1]);
              print(tabsRouter.childControllers[1].parent());

              debugPrint('========== tabsRouter.innerRouterOf ===========');
              print(tabsRouter.innerRouterOf(SettingsRouterRoute.name)?.stack);
              print(tabsRouter.innerRouterOf(SettingsRouterRoute.name));
              print(tabsRouter.parent());
            }
          },
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

// スタンダードパターン
// class DashboardPage extends StatelessWidget {
//   const DashboardPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AutoTabsRouter(
//       // タブルートのリスト。ここで使用するルートは、子ルートとして宣言する必要がある。
//       routes: const [
//         HomeRoute(),
//         PostsRoute(),
//         SettingsRoute(),
//       ],
//       transitionBuilder: (context, child, animation) => FadeTransition(
//         opacity: animation,
//         // 渡された子ルートは、技術的にはアニメーション化されたセレクテッドタブのページ。
//         child: child,
//       ),
//       builder: (context, child) {
//         // コンテキストを使用して、スコープ付きTabsRouterコントローラを取得する。
//         final tabsRouter = AutoTabsRouter.of(context);

//         // ここでは、AutoTabsRouterの内部でScaffoldを構築している。
//         // このコンテキストで提供される tabsRouter コントローラにアクセスする。
//         return Scaffold(
//             body: child,
//             bottomNavigationBar: BottomNavigationBar(
//               currentIndex: tabsRouter.activeIndex,
//               onTap: (index) {
//                 // ここでTabの切り替えを行う。
//                 tabsRouter.setActiveIndex(index);
//               },
//               items: const [
//                 BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
//                 BottomNavigationBarItem(
//                     label: 'Posts', icon: Icon(Icons.post_add)),
//                 BottomNavigationBarItem(
//                     label: 'Settings', icon: Icon(Icons.settings)),
//               ],
//             ));
//       },
//     );
//   }
// }

// PageViewパターン
// class DashboardPage extends StatelessWidget {
//   const DashboardPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AutoTabsRouter.pageView(
//       routes: const [
//         HomeRoute(),
//         PostsRoute(),
//         SettingsRoute(),
//       ],
//       builder: (context, child, _) {
//         final tabsRouter = AutoTabsRouter.of(context);
//         return Scaffold(
//             body: child,
//             bottomNavigationBar: BottomNavigationBar(
//               currentIndex: tabsRouter.activeIndex,
//               onTap: (index) {
//                 tabsRouter.setActiveIndex(index);
//               },
//               items: const [
//                 BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
//                 BottomNavigationBarItem(
//                     label: 'Posts', icon: Icon(Icons.post_add)),
//                 BottomNavigationBarItem(
//                     label: 'Settings', icon: Icon(Icons.settings)),
//               ],
//             ));
//       },
//     );
//   }
// }

// ヘッダー部分にタブバーを表示（tabBar）パターン
// class DashboardPage extends StatelessWidget {
//   const DashboardPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AutoTabsRouter.tabBar(
//       routes: const [
//         HomeRoute(),
//         PostsRoute(),
//         SettingsRoute(),
//       ],
//       builder: (context, child, controller) {
//         final tabsRouter = AutoTabsRouter.of(context);
//         return Scaffold(
//           appBar: AppBar(
//             title: Text(context.topRoute.name),
//             leading: const AutoLeadingButton(),
//             bottom: TabBar(
//               controller: controller,
//               tabs: const [
//                 Tab(text: 'Home', icon: Icon(Icons.home)),
//                 Tab(text: 'Posts', icon: Icon(Icons.post_add)),
//                 Tab(text: 'Settings', icon: Icon(Icons.settings)),
//               ],
//             ),
//           ),
//           body: child,
//           bottomNavigationBar: BottomNavigationBar(
//             currentIndex: tabsRouter.activeIndex,
//             onTap: (index) {
//               tabsRouter.setActiveIndex(index);
//             },
//             items: const [
//               BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
//               BottomNavigationBarItem(
//                   label: 'Posts', icon: Icon(Icons.post_add)),
//               BottomNavigationBarItem(
//                   label: 'Settings', icon: Icon(Icons.settings)),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
