import 'package:flutter_beginner_class/24_01_03/model/repository/mask_repository.dart';
import 'package:flutter_beginner_class/24_01_03/view_model/main_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;


void diSetup() {
  getIt.registerFactory<MaskRepositoy>(() => MaskRepositoy());

  getIt.registerFactory<MainViewModel>(
          () => MainViewModel(repositoy: getIt<MaskRepositoy>()));
}