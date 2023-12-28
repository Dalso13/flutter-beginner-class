

import 'dart:convert';
import 'package:flutter_beginner_class/23_12_28/exam1/dto/photo.dart';
import 'package:http/http.dart' as http;

class PhotoApi {
  Future<List<Photo>> getImgData(int albumId) async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos?albumId=$albumId'));
    final List<dynamic> data = jsonDecode(response.body);

    return  data.map((e) => Photo.fromJson(e)).toList();
  }
}