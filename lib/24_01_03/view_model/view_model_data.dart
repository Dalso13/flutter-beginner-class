import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../model/modle_dto/mask_model.dart';

part 'view_model_data.freezed.dart';

part 'view_model_data.g.dart';

@freezed
class ViewModelData with _$ViewModelData {
  const factory ViewModelData({
    @Default([]) List<MaskModel> mask,
    @Default(false) bool isData,
  }) = _ViewModelData;

  factory ViewModelData.fromJson(Map<String, Object?> json) => _$ViewModelDataFromJson(json);
}