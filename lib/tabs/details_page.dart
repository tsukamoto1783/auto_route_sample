import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: const Text('Details Page \n ネストされたPageです。'),
        ),
      ),
    );
  }
}
