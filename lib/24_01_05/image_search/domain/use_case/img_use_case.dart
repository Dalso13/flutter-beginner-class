import 'package:flutter_beginner_class/24_01_05/image_search/core/result.dart';
import 'package:flutter_beginner_class/24_01_05/image_search/domain/model/img_model.dart';
import 'package:flutter_beginner_class/24_01_05/image_search/domain/repository/img_repository.dart';

class ImgUseCase {
  final ImgRepository _imgRepository;

  const ImgUseCase({
    required ImgRepository imgRepository,
  }) : _imgRepository = imgRepository;

  Future<Result<List<ImgModel>>> execute(String query) async {
    final result = await _imgRepository.getImgModel(query);
    
    // view_model 에서 처리해줄 코드 여기로 옮기기
   // switch (result) {
   //   case Success<List<ImgModel>>() :
   //
   //   case Error<List<ImgModel>>():
   //    
   // }

    return result;
  }

}