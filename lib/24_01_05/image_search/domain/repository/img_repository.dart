import 'package:flutter_beginner_class/24_01_05/image_search/core/result.dart';
import 'package:flutter_beginner_class/24_01_05/image_search/domain/model/img_model.dart';

abstract interface class ImgRepository {
  Future<Result<List<ImgModel>>> getImgModel(String query);
}