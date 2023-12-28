
import 'package:flutter_beginner_class/23_12_28/exam1/mapper/photo_mapper.dart';
import 'package:flutter_beginner_class/23_12_28/exam1/model/photo_model.dart';

import '../api/photo_api.dart';

class PhotoRepository {
  Future<List<PhotoModle>> getAlbumList(int albumId) async {
    final dto = await PhotoApi().getImgData(albumId);

    return dto.map((e) => e.toPhoto()).toList();
  }
}