import 'package:flutter/material.dart';
import 'package:flutter_beginner_class/23_12_20/model/travel.dart';
import 'package:flutter_beginner_class/repository/travel_repository.dart';

import '00_main.dart';

void main() {
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
      home: TravelListScreen(),
    );
  }
}

class TravelListScreen extends StatefulWidget {
  const TravelListScreen({super.key});

  @override
  State<TravelListScreen> createState() => _TravelListScreenState();
}

class _TravelListScreenState extends State<TravelListScreen> {
  @override
  Widget build(BuildContext context) {
    final repository = TravelRepository().getTrable();

    return Scaffold(
      appBar: AppBar(
        title: Text("나만의 트래블"),
      ),
      body: SizedBox(
        height: 500,
        child: ListView(
          children: repository.map((e) {
            return CampingWidget(trable: e);
          }).toList(),
        ),
      ),
    );
  }
}
