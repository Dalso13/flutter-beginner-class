import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../model/model_dto/img_model.dart';

part 'main_state.freezed.dart';

part 'main_state.g.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default([]) List<ImgModel> imgList,
    @Default(false) bool isLoding,
  }) = _MainState;

  factory MainState.fromJson(Map<String, Object?> json) => _$MainStateFromJson(json);
}