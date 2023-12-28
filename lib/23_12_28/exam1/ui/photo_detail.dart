import 'package:flutter/material.dart';
import 'package:flutter_beginner_class/23_12_28/exam1/model/photo_model.dart';

class PhotoDetail extends StatefulWidget {
  PhotoModle photo;

  PhotoDetail({super.key , required this.photo});

  @override
  State<PhotoDetail> createState() => _PhotoDetailState();
}

class _PhotoDetailState extends State<PhotoDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('세부 이미지'),
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.network(widget.photo.url),
            Text(widget.photo.title , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text('photoId : ${widget.photo.id}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text('albumId : ${widget.photo.albumId}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ],
        ),
      )),
    );
  }
}
