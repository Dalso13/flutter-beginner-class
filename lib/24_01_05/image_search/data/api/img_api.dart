import 'dart:convert';

import 'package:http/http.dart' as http;
class ImgApi {
  Future<Map<String,dynamic>> getImgJson(String query) async {
    final response = await http.get(Uri.parse('https://pixabay.com/api/?key=41486622-3152f8ed9d460f88bc72c1679&q=$query&image_type=photo&pretty=true'));

    return jsonDecode(response.body);

   }
  }
