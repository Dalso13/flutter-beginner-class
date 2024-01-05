import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_beginner_class/24_01_05/image_search/core/result.dart';
import 'package:flutter_beginner_class/24_01_05/image_search/domain/use_case/img_use_case.dart';
import 'package:flutter_beginner_class/24_01_05/image_search/presentation/view_model/main_event.dart';
import 'package:flutter_beginner_class/24_01_05/image_search/presentation/view_model/main_state.dart';

import '../../domain/model/img_model.dart';

class MainViewModel extends ChangeNotifier{
  final ImgUseCase _imgUseCase;
  MainState _mainState = const MainState();
  final StreamController<MainEvent> _eventController = StreamController<MainEvent>();

  MainViewModel({
    required ImgUseCase imgUseCase,
  }) : _imgUseCase = imgUseCase;


  MainState get mainState => _mainState;
  Stream<MainEvent> get eventStream => _eventController.stream;

  Future<void> imgSearch(String query) async {
    final result = await _imgUseCase.execute(query);
    _mainState = _mainState.copyWith(
        isLoading: true,
    );
    notifyListeners();

    switch (result) {
      case Success<List<ImgModel>>() :
          _mainState = _mainState.copyWith(
            isLoading: false,
            imgModel: result.data
          );
          _eventController.add(const MainEvent.getSnackBar());
        case Error<List<ImgModel>>():
          _mainState = _mainState.copyWith(
              isLoading: false,
              imgModel: []
          );
          _eventController.add(const MainEvent.getDiaLog());
    }
    notifyListeners();

  }
}