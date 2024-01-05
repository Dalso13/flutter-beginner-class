import 'package:flutter/material.dart';
import 'package:flutter_beginner_class/24_01_05/image_search/domain/model/img_model.dart';

class DetailImgScreen extends StatelessWidget {
  final ImgModel _image;

  const DetailImgScreen({super.key, required ImgModel image}): _image = image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(_image.previewURL),
      ),
    );
  }
}
