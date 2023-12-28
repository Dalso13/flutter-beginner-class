import 'package:flutter_beginner_class/23_12_28/exam1/dto/album.dart';
import 'package:flutter_beginner_class/23_12_28/exam1/model/album_model.dart';

extension AlbumMapper on Album {
  AlbumModel toAlbum() {
    return AlbumModel(id: id ?? 0, title: title ?? '제목없음');
  }
}