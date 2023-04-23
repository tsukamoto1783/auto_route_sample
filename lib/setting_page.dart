import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingDefoPage extends AutoRouter {
  const SettingDefoPage({super.key});
}

@RoutePage()
class SettingPage extends StatelessWidget {
  const SettingPage({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('aaaaaaa'),
          onPressed: () => context.router.pop(),
        ),
      ),
    );
  }
}
