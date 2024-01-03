import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'mask_model.freezed.dart';

part 'mask_model.g.dart';

@freezed
class MaskModel with _$MaskModel {
  const factory MaskModel({
    required String addr,
    required String name,
    required String remainStat,
    required double lat,
    required double lng
  }) = _MaskModel;
  
  factory MaskModel.fromJson(Map<String, Object?> json) => _$MaskModelFromJson(json); 
}