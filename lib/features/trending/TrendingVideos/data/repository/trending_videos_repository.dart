import 'package:play_tv/data/network/client/api_client.dart';
import 'package:play_tv/features/trending/TrendingVideos/data/network/entity/trending_videos_entity.dart';
import 'package:play_tv/features/trending/TrendingVideos/data/network/network_mapper.dart';
import 'package:play_tv/features/trending/TrendingVideos/domain/model/trending_videos.dart';

import 'package:play_tv/features/trending/TrendingVideos/domain/model/video.dart' as video;

class TrendingVideosRepository {
  final ApiClient apiClient;
  final NetworkMapper networkMapper;

  TrendingVideosRepository({
    required this.apiClient,
    required this.networkMapper,
  });

  Future<List<TrendingVideos>> getTrendingVideos() async {
    final trendingVideosEntity = await apiClient.getTrendingVideos();
    return networkMapper.toTrendingVideosList([trendingVideosEntity]);
  }

  Future<List<video.Video>> mapToTrendingVideos(
    TrendingVideosEntity trendingVideosEntity
  ) async {
    final videoEntities = await apiClient.mapToTrendingVideos(trendingVideosEntity);
    print('videoEntities');
    print(videoEntities);
    return networkMapper.toVideos([videoEntities]);
  }
}
