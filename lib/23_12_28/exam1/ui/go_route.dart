import 'dart:convert';

import 'package:flutter_beginner_class/23_12_28/exam1/model/photo_model.dart';
import 'package:flutter_beginner_class/23_12_28/exam1/ui/photo_detail.dart';
import 'package:flutter_beginner_class/23_12_28/exam1/ui/photo_main.dart';
import 'package:go_router/go_router.dart';

import 'album_main.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AlbumMain(),
    ),
    GoRoute(
      path: '/photoList',
      builder: (context, state) {
        return PhotoMain(albumId: int.parse(state.uri.queryParameters['albumId']!));
      },
    ),
    GoRoute(
      path: '/photoDetail',
      builder: (context, state) {
        final photo = state.uri.queryParameters['photo']!;
        return PhotoDetail(photo: PhotoModle.fromJson(jsonDecode(photo)));
      },
    ),
  ],
);