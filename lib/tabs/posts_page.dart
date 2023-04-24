import 'package:auto_route/auto_route.dart';
import 'package:auto_route_sample/app_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PostsRouterPage extends AutoRouter {
  const PostsRouterPage({super.key});
}

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
          child: ElevatedButton(
              child: const Text('Details Page'),
              onPressed: () => context.router.push(const Details1Route())),
        ),
      ),
    );
  }
}
