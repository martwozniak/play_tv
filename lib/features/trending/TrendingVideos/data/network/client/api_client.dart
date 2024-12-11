// import 'package:dio/dio.dart';
// import 'package:play_tv/features/trending/TrendingVideos/data/network/entity/trending_videos_entity.dart';

// class ApiClient {
//   late final Dio _dio;

//   ApiClient({
//     required String baseUrl,
//   }) {
//     _dio = Dio(BaseOptions(
//       baseUrl: baseUrl,
//     ))..interceptors.add(LogInterceptor(requestBody: true, responseBody: true),);
//   }

//   Future<List<TrendingVideosEntity>> getTrendingVideos() async {
//     final response = await _dio.get('trending/videos/last7days');

//     if (response.statusCode != null && response.statusCode! >= 400) {
//       print(response.statusCode);
//       throw Exception('Failed to get trending videos');
//     } else if (response.statusCode! >= 200 && response.data is Map<String, dynamic>) {
//       final trendingVideosEntity = TrendingVideosEntity.fromJson(response.data as Map<String, dynamic>);
//       return [trendingVideosEntity];
//     } else {
//       throw Exception('Failed to get trending videos');
//     }
//   }
// }

