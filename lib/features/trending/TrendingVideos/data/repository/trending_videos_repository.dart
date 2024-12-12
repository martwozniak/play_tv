import 'package:play_tv/data/network/client/api_client.dart';
import 'package:play_tv/features/trending/TrendingVideos/data/network/entity/trending_videos_entity.dart';
import 'package:play_tv/features/trending/TrendingVideos/data/network/network_mapper.dart';
import 'package:play_tv/features/trending/TrendingVideos/domain/model/trending_videos.dart';
import 'dart:developer';

import 'package:play_tv/features/trending/TrendingVideos/domain/model/video.dart' as video;
import 'package:play_tv/features/trending/TrendingVideos/domain/model/user.dart' as user;

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

  Future<TrendingVideosEntity> getTrendingVideosEntity() async {
    return await apiClient.getTrendingVideos();
  }

  Future<List<video.Video>> mapToTrendingVideos(TrendingVideosEntity trendingVideosEntity) async {
    final videoEntities = await apiClient.mapToTrendingVideos(trendingVideosEntity);
    inspect(videoEntities);

    return networkMapper.toVideos([videoEntities]);
  }

  Future<List<video.Video>> mapToTrendingVideosFuture(Future<TrendingVideosEntity> trendingVideosEntity) async {
    final trending = await trendingVideosEntity;
    final videoEntities = await apiClient.mapToTrendingVideos(trending);
    print('videoEntities');
    print(videoEntities);
    return networkMapper.toVideos([videoEntities]);
  }

  Future<user.User> getUser(String ulid) async {
    final userEntity = await apiClient.getUser(ulid);
    inspect(userEntity);
    return networkMapper.toUser(userEntity.data[0]);
  }
}
