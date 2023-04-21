import 'package:auto_route_sample/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter(); //追加

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // routerを追加
      routerConfig: _appRouter.config(), // 追加
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: const HomePage(), // homeを削除
    );
  }
}
