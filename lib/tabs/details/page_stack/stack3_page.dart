import 'package:auto_route/auto_route.dart';
import 'package:auto_route_sample/app_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class Stack3Page extends StatelessWidget {
  const Stack3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('スタックテスト 3枚目'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: ElevatedButton(
            child: const Text('Next'),
            onPressed: () {
              print(context.router.stack);

              // prints current route name
              print(context.router.current.name);

              // prints current route arguments
              print(context.router.current.args);

              context.router.push(const Stack4Route());
            }),
      ),
    );
  }
}
