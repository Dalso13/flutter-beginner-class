

import 'dart:convert';

import 'package:flutter_beginner_class/23_12_28/exam1/dto/album.dart';
import 'package:http/http.dart' as http;

class AlbumApi {
  Future<List<Album>> getAlbumData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    final List<dynamic> data = jsonDecode(response.body);

    return  data.map((e) => Album.fromJson(e)).toList();
  }
}