
import 'package:flutter_beginner_class/24_01_05/image_search/domain/model/img_model.dart';
import 'package:flutter_beginner_class/24_01_05/image_search/presentation/ui/detail_img_screen.dart';
import 'package:flutter_beginner_class/24_01_05/image_search/presentation/ui/main_screen.dart';
import 'package:flutter_beginner_class/24_01_05/image_search/presentation/view_model/main_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../di/get_it.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ChangeNotifierProvider(create: (_) {
        return getIt<MainViewModel>();
      },
      child: const MainScreen()),
    ),
    GoRoute(
      path: '/detail',
      builder: (context, state) {
        final img = state.extra as ImgModel;
        return DetailImgScreen(image: img);
      },
    ),
  ],
);