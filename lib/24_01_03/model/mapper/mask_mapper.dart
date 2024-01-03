import 'package:flutter_beginner_class/24_01_03/model/dto/mask_dto.dart';
import 'package:flutter_beginner_class/24_01_03/model/modle_dto/mask_model.dart';

extension MaskMapper on Mask {
  MaskModel maskMapper() {

    return MaskModel(
      addr: addr ?? '',
      name: name ?? '',
      remainStat: remainStat ?? '',
      lat: lat ?? -1,
      lng: lng ?? -1,
    );
  }
}
