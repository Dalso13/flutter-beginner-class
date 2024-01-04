import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_beginner_class/24_01_04/img_search/model/model_dto/img_model.dart';
import 'package:flutter_beginner_class/24_01_04/img_search/view_model/main_state.dart';
import 'package:flutter_beginner_class/24_01_04/img_search/view_model/result/result.dart';
import '../model/repository/ImgRepository.dart';
import 'result/main_event.dart';

class MainViewModel extends ChangeNotifier {
  final ImgRepository _repository;
  MainState _mainState = MainState();
  final _eventController = StreamController<MainEvent>();

  MainViewModel({
    required ImgRepository repository,
  }) : _repository = repository;

  MainState get mainState => _mainState;
  Stream<MainEvent> get eventStream => _eventController.stream;


  Future<void> updateImg(String query) async {
    _mainState = _mainState.copyWith(
      isLoding: true
    );
    notifyListeners();

    final data = await _repository.getImg(query);
    switch (data) {
      case Success<List<ImgModel>>() :
        _mainState = _mainState.copyWith(
            imgList: data.data,
            isLoding: false
        );
        _eventController.add(MainEvent.getSnackBar('성공'));
      case Error():
        _mainState = _mainState.copyWith(
            isLoding: false
        );
        _eventController.add(MainEvent.getDiaLog('연결 오류'));
    }
    notifyListeners();
  }

}