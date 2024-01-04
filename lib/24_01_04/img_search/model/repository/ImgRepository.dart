import 'package:flutter_beginner_class/24_01_04/img_search/model/api/img_api.dart';
import 'package:flutter_beginner_class/24_01_04/img_search/model/mapper/img_mapper.dart';
import 'package:flutter_beginner_class/24_01_04/img_search/model/model_dto/img_model.dart';

import '../../view_model/result/result.dart';

class ImgRepository {
  final ImgApi imgApi = ImgApi();

  Future<Result<List<ImgModel>>> getImg(String query) async {
    try {
      final dto = await imgApi.imgApi(query);

      return Result.success(dto.map((e) => e.getMapper()).toList());
    } catch (e) {
      return const Result.error('에러 발생');
    }
  }
}
