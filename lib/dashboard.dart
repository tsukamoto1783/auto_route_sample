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
        PostsRoute(),
        SettingsRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: (int index) {
            if (tabsRouter.activeIndex != index) {
              print("ifの中");
              tabsRouter.setActiveIndex(index);
            } else {
              print("ifの外");
              // Base画面の上にスタックされている画面を全て破棄したい
              // BottomNavigationBarのタブをタップしても、スタックは乘っていない。
              // これは、Base画面のスタック情報を参照するため。
              // Base画面のスタック情報ではなく、Base画面の上に乘っている画面のスタック情報を破棄したい。
              // どうすればいいのか？
              // 現在アクティブなタブのルートコントローラを取得
              // final activeRouter = tabsRouter.innerRouter;

              // 現在アクティブなタブのルートコントローラを使って、スタックされている画面を全て破棄
              // activeRouter.popUntilRoot();

              print(context.router.stack);
              print(context.router.current.name);
              print(context.router.current.args);
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
