
import 'package:flutter/material.dart';
import 'package:flutter_beginner_class/24_01_03/view/state/get_it.dart';
import 'package:flutter_beginner_class/24_01_03/view_model/main_view_model.dart';
import 'package:provider/provider.dart';

import 'view/main_screen.dart';

main() {
  diSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(create: (_) => getIt<MainViewModel>(),
      child: MainScreen()),
    );
  }
}