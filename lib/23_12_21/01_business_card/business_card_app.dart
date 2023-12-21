import 'package:flutter/material.dart';
import 'package:flutter_beginner_class/23_12_20/model/travel.dart';
import 'package:flutter_beginner_class/23_12_21/01_business_card/business_card.dart';
import 'package:flutter_beginner_class/23_12_21/01_business_card/trave_detail_view.dart';
import 'package:flutter_beginner_class/repository/travel_repository.dart';

class BusinessCardApp extends StatelessWidget {
  final repository = TravelRepository();

  BusinessCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    final travle = repository.getTrable();
    return Scaffold(
      appBar: AppBar(
        title: const Text('명함'),
      ),
      body: BusinessCard(
        travle: travle.first,
        onPhotoPressed: (Travle travle) {
          print('onPhotoPressed');
          Navigator.push(context, 
            MaterialPageRoute(builder: (context) => TravelDetailView(travle: travle))
          );
        },
        onNamePressed: (String name) {
          print('$name');
        },
      ),
    );
  }
}
