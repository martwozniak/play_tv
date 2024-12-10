import 'package:play_tv/data/network/client/api_client.dart';
import 'package:play_tv/data/network/network_mapper.dart';
import 'package:play_tv/domain/model/trending_videos.dart';

class TrendingVideosRepository {
  final ApiClient apiClient;
  final NetworkMapper networkMapper;

  TrendingVideosRepository({
    required this.apiClient,
    required this.networkMapper,
  });

  Future<List<TrendingVideos>> getTrendingVideos() async {
    final trendingVideosEntity = await apiClient.getTrendingVideos();
    return networkMapper.toTrendingVideosList(trendingVideosEntity);
  }
}
