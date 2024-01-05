import 'package:flutter/material.dart';
import 'package:flutter_beginner_class/24_01_05/image_search/di/get_it.dart';
import 'package:flutter_beginner_class/24_01_05/image_search/route/route.dart';

main() {
  diSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      )
    );
  }
}