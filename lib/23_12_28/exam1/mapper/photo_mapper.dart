import 'package:flutter_beginner_class/23_12_28/exam1/dto/photo.dart';
import 'package:flutter_beginner_class/23_12_28/exam1/model/photo_model.dart';

extension PhotoMapper on Photo {
  PhotoModle toPhoto() {
    return PhotoModle(
        id: id ?? 0,
        albumId: albumId ?? 0,
        title: title ?? '제목없음',
        url: url ?? '',
        thumbnailUrl: thumbnailUrl ?? '');
  }
}
