
import 'package:flutter_beginner_class/24_01_05/image_search/data/repository/img_repository_impl.dart';
import 'package:flutter_beginner_class/24_01_05/image_search/domain/repository/img_repository.dart';
import 'package:flutter_beginner_class/24_01_05/image_search/domain/use_case/img_use_case.dart';
import 'package:flutter_beginner_class/24_01_05/image_search/presentation/view_model/main_view_model.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<ImgRepository>(ImgRepositoryImpl());
  
  getIt.registerSingleton<ImgUseCase>(ImgUseCase(imgRepository: getIt<ImgRepository>()));
  getIt.registerFactory<MainViewModel>(() => MainViewModel(imgUseCase: getIt<ImgUseCase>()));
}