import 'package:flutter/material.dart';
import 'package:play_tv/features/trending/TrendingVideos/presentation/list/movies_list_screen.dart';

class AppRouter {
  static Map<String, WidgetBuilder> get routes => {
        '/': (context) => const MoviesList(),
      };
}
