import 'dart:convert';

import 'package:flutter_beginner_class/24_01_03/model/dto/mask_dto.dart';
import 'package:http/http.dart' as http;

class MaskApi {
  Future<List<Mask>> getMaskDto() async {
    final response =
        await http.get(Uri.parse('http://104.198.248.76:3000/mask'));
    final Map<String,dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));
    final List<dynamic> mask = json['stores'];

    return mask.map((e) => Mask.fromJson(e)).toList();
  }
}
