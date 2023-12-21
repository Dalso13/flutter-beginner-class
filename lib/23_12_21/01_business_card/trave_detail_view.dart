import 'package:flutter/material.dart';

import '../../23_12_20/model/travel.dart';

class TravelDetailView extends StatelessWidget {
  final Travle travle;

  const TravelDetailView({super.key, required this.travle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Hero(
            tag: travle.id,
            child: Image.network(travle.imgUrl),
          )
        ],
      ),
    );
  }
}
