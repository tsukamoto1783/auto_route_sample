import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class Details1Page extends StatelessWidget {
  const Details1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details1 Page'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: const Text('Details 1 Page \n ネストされたPageです。'),
        ),
      ),
    );
  }
}
