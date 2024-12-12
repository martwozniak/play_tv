import 'package:play_tv/data/network/client/api_client.dart';
import 'package:play_tv/features/trending/TrendingVideos/data/network/entity/trending_videos_entity.dart';
import 'package:play_tv/features/trending/TrendingVideos/data/network/network_mapper.dart';
import 'package:play_tv/features/trending/TrendingVideos/domain/model/trending_videos.dart';
import 'dart:developer';

import 'package:play_tv/features/trending/TrendingVideos/domain/model/video.dart'
    as video;
import 'package:play_tv/features/trending/TrendingVideos/domain/model/user.dart'
    as user;

class TrendingVideosRepository {
  final ApiClient apiClient;
  final NetworkMapper networkMapper;

  TrendingVideosRepository({
    required this.apiClient,
    required this.networkMapper,
  });

  Future<TrendingVideosEntity> getTrendingVideosEntity([String? cursor]) async {
    try {
      print('Repository: Getting trending videos entity with cursor: $cursor');
      final entity = cursor == null
          ? await apiClient.getTrendingVideos()
          : await apiClient.getTrendingVideosFromCursor(cursor);
      print(
          'Repository: Got trending videos entity with ${entity.ulids.length} UIDs');
      return entity;
    } catch (e) {
      print('Repository: Error getting trending videos entity: $e');
      rethrow;
    }
  }

  Future<List<video.Video>> getTrendingVideosWithCursor(
      [String? cursor]) async {
    try {
      print('Repository: Getting trending videos with cursor: $cursor');
      final trendingVideosEntity = await getTrendingVideosEntity(cursor);

      if (trendingVideosEntity.ulids.isEmpty) {
        print('Repository: No UIDs found in trending videos entity');
        return [];
      }

      print('Repository: Got ${trendingVideosEntity.ulids.length} UIDs');
      print('Repository: Next cursor: ${trendingVideosEntity.nextCursor}');

      final videos = await mapToTrendingVideos(trendingVideosEntity);
      print('Repository: Mapped ${videos.length} videos');
      return videos;
    } catch (e) {
      print('Repository: Error getting trending videos: $e');
      rethrow;
    }
  }

  Future<List<video.Video>> mapToTrendingVideos(
      TrendingVideosEntity trendingVideosEntity) async {
    try {
      print(
          'Repository: Mapping ${trendingVideosEntity.ulids.length} UIDs to videos');
      final videoEntities =
          await apiClient.mapToTrendingVideos(trendingVideosEntity);
      final videos = networkMapper.toVideos([videoEntities]);
      print('Repository: Successfully mapped to ${videos.length} videos');
      return videos;
    } catch (e) {
      print('Repository: Error mapping trending videos: $e');
      rethrow;
    }
  }

  Future<user.User> getUser(String ulid) async {
    try {
      print('Repository: Getting user with ULID: $ulid');
      final userEntity = await apiClient.getUser(ulid);
      final user = networkMapper.toUser(userEntity.data[0]);
      print('Repository: Successfully got user: ${user.name}');
      return user;
    } catch (e) {
      print('Repository: Error getting user: $e');
      rethrow;
    }
  }
}
