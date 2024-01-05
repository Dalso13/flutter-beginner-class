import 'package:flutter_beginner_class/24_01_05/image_search/data/dto/img.dart';
import 'package:flutter_beginner_class/24_01_05/image_search/domain/model/img_model.dart';

extension ImgMapper on Img {
  ImgModel getMapper() {
    return ImgModel(previewURL: previewURL ?? '');
  }
}