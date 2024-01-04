import 'package:flutter_beginner_class/24_01_04/img_search/model/dto/img.dart';
import 'package:flutter_beginner_class/24_01_04/img_search/model/model_dto/img_model.dart';

extension ImgMapper on Img {
  ImgModel getMapper() {
    return ImgModel(previewURL: previewURL ?? '');
  }
}