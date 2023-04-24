import 'package:auto_route/auto_route.dart';
import 'package:auto_route_sample/app_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class Stack4Page extends StatelessWidget {
  const Stack4Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('スタックテスト 4 Page'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('4枚目 Page'),
          Center(
            child: ElevatedButton(
                child: const Text('Stackの1枚目へ戻る'),
                onPressed: () => context.router.popUntil(
                    (route) => route.settings.name == Stack1Route.name)),
          ),
          //       以下だとエラーになる。SettingsRouteがルートディレクトリなので、PostsRouteにPopすると死ぬ。popできない。
          //       onPressed: () => context.router.popUntil(
          //           (route) => route.settings.name == PostsRoute.name)),
          Center(
            child: ElevatedButton(
                child: const Text('ルートへ戻る'),
                onPressed: () =>
                    context.router.popUntil((route) => route.isFirst)),
          ),
        ],
      ),
    );
  }
}
