import 'package:dio/dio.dart';
import 'package:play_tv/features/trending/TrendingVideos/data/network/entity/trending_videos_entity.dart';
import 'package:play_tv/features/trending/TrendingVideos/data/network/entity/video_entity.dart';
import 'package:play_tv/features/trending/TrendingVideos/data/network/entity/user_entity.dart' as u;

class ApiClient {
  late final Dio _dio;

  ApiClient({
    required String baseUrl,
  }) {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ))..interceptors.add(LogInterceptor(requestBody: true, responseBody: true),);
  }

  Future<TrendingVideosEntity> getTrendingVideos() async {
    final response = await _dio.get('trending/videos/last7days');

    if (response.statusCode != null && response.statusCode! >= 400) {
      print(response.statusCode);
      throw Exception('Failed to get trending videos');
    } else if (response.statusCode! >= 200 && response.data is Map<String, dynamic>) {
      final trendingVideosEntity = TrendingVideosEntity.fromJson(response.data as Map<String, dynamic>);
      final result = await mapToTrendingVideos(trendingVideosEntity);
      print(result);
      return trendingVideosEntity;
    } else {
      throw Exception('Failed to get trending videos');
    }
  }

  Future<VideoEntity> mapToTrendingVideos(TrendingVideosEntity trendingVideosEntity) async {
    // final videoIds = trendingVideosEntity.map((video) => video.ulids).toList();
    // trendingVideosEntity.ulids
    final response = await _dio.post(
      'posts/map', 
      data: {
        "data": trendingVideosEntity.ulids,
        "responseType": "videos"
      },
    );

    if (response.statusCode == 200) {
      final videoEntity = VideoEntity.fromJson(response.data as Map<String, dynamic>);
      print(videoEntity);
      return videoEntity;
      // final List<dynamic> videosJson = response.data as List<dynamic>;
      // return videosJson.map((json) => VideoEntity.fromJson(json as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Failed to map trending videos');
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
    } else if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
      return u.UserEntity.fromJson(response.data as Map<String, dynamic>);
    } else {
      throw Exception('Failed to get user profile');
    }
  }
}

