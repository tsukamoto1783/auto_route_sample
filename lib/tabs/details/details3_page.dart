import 'package:auto_route/auto_route.dart';
import 'package:auto_route_sample/app_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class Details3Page extends StatelessWidget {
  const Details3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details3 Page'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text('Details 3 Page \n ネストされたPageです。'),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  child: const Text('スタックテスト Page'),
                  onPressed: () => context.router.push(const Stack1Route())),
            ),
          ],
        ),
      ),
    );
  }
}
