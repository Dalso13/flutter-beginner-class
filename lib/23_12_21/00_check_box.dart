import 'package:flutter/material.dart';
import 'package:flutter_beginner_class/23_12_20/model/travel.dart';
import 'package:flutter_beginner_class/repository/travel_repository.dart';

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
      home: const CheckBoxListView(),
    );
  }
}

class CheckBoxListView extends StatefulWidget {

  const CheckBoxListView({super.key});

  @override
  State<CheckBoxListView> createState() => _CheckBoxListViewState();
}

class _CheckBoxListViewState extends State<CheckBoxListView> {
  final repository = TravelRepository().getTrable();
  final favorites = <int>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("체크기능"),
      ),
      body: ListView(
          children: repository.map((e) {
            return CheckboxListTile(
              title: Text(e.title),
              value: favorites.contains(e.id),
              onChanged: (bool? value) {
                setState(() {
                  if(value! == true){
                    favorites.add(e.id);
                  } else {
                    favorites.remove(e.id);
                  }
                });
              },
            );
          }).toList()
      ),
    );
  }
}
