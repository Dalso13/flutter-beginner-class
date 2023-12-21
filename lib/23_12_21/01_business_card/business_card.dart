import 'package:flutter/material.dart';
import 'package:flutter_beginner_class/23_12_20/model/travel.dart';
import 'package:flutter_beginner_class/23_12_21/01_business_card/trave_detail_view.dart';

class BusinessCard extends StatelessWidget {
  final Travle travle;

  final void Function(Travle travle) onPhotoPressed;
  final void Function(String name) onNamePressed;

  const BusinessCard({
    super.key,
    required this.travle,
    required this.onPhotoPressed,
    required this.onNamePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              onPhotoPressed(travle);
            },
            child: Hero(
              tag: travle.id,
              child: Image.network(
                travle.imgUrl,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onNamePressed(travle.title);
            },
            child: Text(
              travle.title,
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
