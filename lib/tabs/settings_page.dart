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
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              child: const Text('Details Page'),
              onPressed: () => context.router.push(const DetailsRoute())),
        ),
      ),
    );
  }
}
