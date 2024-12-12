import 'package:dio/dio.dart';
import 'package:play_tv/features/trending/TrendingVideos/data/network/entity/trending_videos_entity.dart';
import 'package:play_tv/features/trending/TrendingVideos/data/network/entity/video_entity.dart';
import 'package:play_tv/features/trending/TrendingVideos/data/network/entity/user_entity.dart'
    as u;

class ApiClient {
  late final Dio _dio;

  ApiClient({
    required String baseUrl,
  }) {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ))
      ..interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true),
      );
  }

  Future<TrendingVideosEntity> getTrendingVideos() async {
    try {
      print('Fetching initial trending videos');
      final response = await _dio.get('trending/videos/last7days');
      print('Response status code: ${response.statusCode}');
      print('Response data: ${response.data}');

      if (response.statusCode != null && response.statusCode! >= 400) {
        print('Error status code: ${response.statusCode}');
        throw Exception('Failed to get trending videos');
      } else if (response.statusCode! >= 200 &&
          response.data is Map<String, dynamic>) {
        final trendingVideosEntity = TrendingVideosEntity.fromJson(
            response.data as Map<String, dynamic>);
        print('Trending videos entity: $trendingVideosEntity');
        print('Number of UIDs: ${trendingVideosEntity.ulids.length}');
        return trendingVideosEntity;
      } else {
        throw Exception(
            'Failed to get trending videos - invalid response format');
      }
    } catch (e, stackTrace) {
      print('Error getting trending videos: $e');
      print('Stack trace: $stackTrace');
      rethrow;
    }
  }

  Future<TrendingVideosEntity> getTrendingVideosFromCursor(
      String cursor) async {
    try {
      print('Fetching trending videos with cursor: $cursor');
      final response =
          await _dio.get('trending/videos/last7days?cursor=$cursor');
      print('Response status code: ${response.statusCode}');
      print('Response data: ${response.data}');

      if (response.statusCode != null && response.statusCode! >= 400) {
        print('Error status code: ${response.statusCode}');
        throw Exception('Failed to get trending videos');
      } else if (response.statusCode! >= 200 &&
          response.data is Map<String, dynamic>) {
        final trendingVideosEntity = TrendingVideosEntity.fromJson(
            response.data as Map<String, dynamic>);
        print('Trending videos entity: $trendingVideosEntity');
        print('Number of UIDs: ${trendingVideosEntity.ulids.length}');
        return trendingVideosEntity;
      } else {
        throw Exception(
            'Failed to get trending videos - invalid response format');
      }
    } catch (e, stackTrace) {
      print('Error getting trending videos with cursor: $e');
      print('Stack trace: $stackTrace');
      rethrow;
    }
  }

  Future<VideoEntity> mapToTrendingVideos(
      TrendingVideosEntity trendingVideosEntity) async {
    try {
      print(
          'Mapping trending videos with ${trendingVideosEntity.ulids.length} UIDs');
      print('UIDs: ${trendingVideosEntity.ulids}');

      final response = await _dio.post(
        'posts/map',
        data: {"data": trendingVideosEntity.ulids, "responseType": "videos"},
      );
      print('Map response status code: ${response.statusCode}');
      print('Map response data: ${response.data}');

      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        final videoEntity =
            VideoEntity.fromJson(response.data as Map<String, dynamic>);
        print('Successfully mapped to video entity');
        return videoEntity;
      } else {
        throw Exception(
            'Failed to map trending videos - invalid response format');
      }
    } catch (e, stackTrace) {
      print('Error mapping trending videos: $e');
      print('Stack trace: $stackTrace');
      rethrow;
    }
  }

  Future<u.UserEntity> getUser(String ulid) async {
    final response = await _dio.post(
      'profile',
      data: {
        "ulids": [ulid],
      },
    );

    if (response.statusCode != null && response.statusCode! >= 400) {
      throw Exception('Failed to get user profile');
    }

    try {
      if (response.statusCode == 200 && response.data is List) {
        final userDataList = response.data as List;
        if (userDataList.isNotEmpty &&
            userDataList[0] is Map<String, dynamic>) {
          final userData = userDataList[0] as Map<String, dynamic>;
          if (userData.containsKey('data')) {
            return u.UserEntity.fromJson(userData);
          }
        }
      }
      throw Exception('Invalid response structure');
    } catch (e) {
      throw Exception('Failed to parse user profile: $e');
    }
  }
}
