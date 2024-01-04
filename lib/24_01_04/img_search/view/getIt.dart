
import 'package:flutter_beginner_class/24_01_04/img_search/model/repository/ImgRepository.dart';
import 'package:get_it/get_it.dart';
import '../view_model/main_view_model.dart';

final getIt = GetIt.instance;

void setInstance() {
  getIt.registerFactory<ImgRepository>(() => ImgRepository());

  getIt.registerFactory<MainViewModel>(() => MainViewModel(repository: getIt<ImgRepository>()));
}