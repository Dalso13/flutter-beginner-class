import 'package:flutter/cupertino.dart';
import 'package:flutter_beginner_class/24_01_03/model/modle_dto/mask_model.dart';
import 'package:flutter_beginner_class/24_01_03/model/repository/mask_repository.dart';
import 'package:flutter_beginner_class/24_01_03/view_model/view_model_data.dart';

class MainViewModel extends ChangeNotifier {
  final MaskRepositoy _repositoy;
  ViewModelData _modelData = const ViewModelData();

  MainViewModel({
    required MaskRepositoy repositoy,
  })  : _repositoy = repositoy;

  ViewModelData get modelData => _modelData;


  Future<void> getDate() async {
    _modelData = _modelData.copyWith(
      isData: true
    );
    notifyListeners();

    _modelData = _modelData.copyWith(
        isData: false,
        mask: await _repositoy.getMaskModel()
    );
    notifyListeners();
  }
}
