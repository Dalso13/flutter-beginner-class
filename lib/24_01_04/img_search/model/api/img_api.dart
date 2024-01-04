import 'dart:convert';

import 'package:flutter_beginner_class/24_01_04/img_search/model/dto/img.dart';
import 'package:http/http.dart' as http;
class ImgApi {
  Future<List<Img>> imgApi(String query) async {
    final response = await http.get(Uri.parse('https://pixabay.com/api/?key=41486622-3152f8ed9d460f88bc72c1679&q=$query&image_type=photo&pretty=true'));

    final Map<String, dynamic> json = jsonDecode(response.body);

    final List<dynamic> hits = json['hits'];

    return hits.map((e) => Img.fromJson(e)).toList();
   }
  }
