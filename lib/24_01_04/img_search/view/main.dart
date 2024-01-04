
import 'package:flutter/material.dart';
import 'package:flutter_beginner_class/24_01_04/img_search/view_model/main_view_model.dart';
import 'package:provider/provider.dart';

import 'getIt.dart';
import 'main_screen.dart';

main() {
  setInstance();
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
      home:  ChangeNotifierProvider(create: (BuildContext context) => getIt<MainViewModel>(),
      child: const MainScreen()),
    );
  }
}