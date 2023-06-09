import 'package:auto_route/auto_route.dart';
import 'package:auto_route_sample/app_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsRouterPage extends AutoRouter {
  const SettingsRouterPage({super.key});
}

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Page'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  child: const Text('Details 1 Page'),
                  onPressed: () => context.router.push(const Details1Route())),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  child: const Text('Details 2 Page'),
                  onPressed: () => context.router.push(const Details2Route())),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  child: const Text('Details 3 Page'),
                  onPressed: () => context.router.push(const Details3Route())),
            ),
          ],
        ),
      ),
    );
  }
}
