import 'package:flutter_beginner_class/24_01_05/image_search/core/result.dart';
import 'package:flutter_beginner_class/24_01_05/image_search/data/api/img_api.dart';
import 'package:flutter_beginner_class/24_01_05/image_search/data/dto/img.dart';
import 'package:flutter_beginner_class/24_01_05/image_search/data/mapper/img_mapper.dart';
import 'package:flutter_beginner_class/24_01_05/image_search/domain/model/img_model.dart';
import 'package:flutter_beginner_class/24_01_05/image_search/domain/repository/img_repository.dart';

class ImgRepositoryImpl implements ImgRepository {

  final ImgApi imgApi = ImgApi();

  @override
  Future<Result<List<ImgModel>>> getImgModel(String query) async {
    try {
      final Map<String, dynamic> json = await imgApi.getImgJson(query);

      if (json['hits'] == null){
        return const Result.success([]);
      }

      final List<dynamic> hits = json['hits'];
      final List<Img> dto = hits.map((e) => Img.fromJson(e)).toList();

      return Result.success(dto.map((e) => e.getMapper()).toList());
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }

  }

}