import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'UserPage',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: const Text('HomePageへ'),
          onPressed: () => context.router.pop(),
        ),
      ),
    );
  }
}
