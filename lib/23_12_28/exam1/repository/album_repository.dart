import 'package:flutter_beginner_class/23_12_28/exam1/api/album_api.dart';
import 'package:flutter_beginner_class/23_12_28/exam1/mapper/album_mapper.dart';
import 'package:flutter_beginner_class/23_12_28/exam1/model/album_model.dart';

class AlbumRepository {
  Future<List<AlbumModel>> getAlbumList() async {
    final dto = await AlbumApi().getAlbumData();

    return dto.map((e) => e.toAlbum()).toList();
  }
}