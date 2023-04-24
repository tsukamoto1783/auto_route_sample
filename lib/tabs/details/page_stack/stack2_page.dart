import 'package:auto_route/auto_route.dart';
import 'package:auto_route_sample/app_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class Stack2Page extends StatelessWidget {
  const Stack2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('スタックテスト 2 Page'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: ElevatedButton(
            child: const Text('2枚目 Page'),
            onPressed: () => context.router.push(const Stack3Route())),
      ),
    );
  }
}
