import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'img_model.freezed.dart';

part 'img_model.g.dart';

@freezed
class ImgModel with _$ImgModel {
  const factory ImgModel({
    required String previewURL
  }) = _ImgModel;

  factory ImgModel.fromJson(Map<String, Object?> json) => _$ImgModelFromJson(json);
}