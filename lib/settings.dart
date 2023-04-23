import 'package:auto_route/auto_route.dart';
import 'package:auto_route_sample/app_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            child: const Text('Setting Page'),
            onPressed: () => context.router.push(HomeRoute())),
      ),
    );
  }
}
