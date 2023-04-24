import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts Page'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: const Text('Posts Page'),
        ),
      ),
    );
  }
}
