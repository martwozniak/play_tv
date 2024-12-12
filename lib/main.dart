import 'package:flutter/material.dart';
import 'package:play_tv/data/network/client/api_client.dart';
import 'package:play_tv/features/trending/TrendingVideos/data/network/network_mapper.dart';
import 'package:play_tv/features/trending/TrendingVideos/data/repository/trending_videos_repository.dart';
import 'package:provider/provider.dart';
import 'package:logger/logger.dart';

import 'features/trending/TrendingVideos/presentation/list/movies_list_screen.dart';

void main() {
  final apiClient = ApiClient(baseUrl: 'https://playtv-api.parler.com/v3/');
  final networkMapper = NetworkMapper(logger: Logger());
  final trendingVideosRepository = TrendingVideosRepository(
    apiClient: apiClient,
    networkMapper: networkMapper,
  );

  runApp(
    MultiProvider(
      providers: [
        Provider<ApiClient>(create: (_) => apiClient),
        Provider<NetworkMapper>(create: (_) => networkMapper),
        Provider<TrendingVideosRepository>(create: (_) => trendingVideosRepository),
        // Add more providers as needed
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Play TV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MoviesList(),
      },
    );
  }
}