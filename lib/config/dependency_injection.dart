import 'package:provider/provider.dart';
import 'package:logger/logger.dart';
import 'package:play_tv/data/network/client/api_client.dart';
import 'package:play_tv/features/trending/TrendingVideos/data/network/network_mapper.dart';
import 'package:play_tv/features/trending/TrendingVideos/data/repository/trending_videos_repository.dart';
import 'package:play_tv/config/app_config.dart';

class DependencyInjection {
  static List<Provider> get providers {
    final apiClient = ApiClient(baseUrl: AppConfig.baseUrl);
    final networkMapper = NetworkMapper(logger: Logger());
    final trendingVideosRepository = TrendingVideosRepository(
      apiClient: apiClient,
      networkMapper: networkMapper,
    );

    return [
      Provider<ApiClient>(create: (_) => apiClient),
      Provider<NetworkMapper>(create: (_) => networkMapper),
      Provider<TrendingVideosRepository>(
          create: (_) => trendingVideosRepository),
    ];
  }
}
