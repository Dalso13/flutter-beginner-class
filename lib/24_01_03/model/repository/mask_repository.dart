import 'package:flutter_beginner_class/24_01_03/model/api/mask_api.dart';
import 'package:flutter_beginner_class/24_01_03/model/mapper/mask_mapper.dart';

import '../dto/mask_dto.dart';
import '../modle_dto/mask_model.dart';

class MaskRepositoy {

  Future<List<MaskModel>> getMaskModel() async {
    final List<Mask> maskDto = await MaskApi().getMaskDto();

    return maskDto.map((e) => e.maskMapper()).toList();
  }
}