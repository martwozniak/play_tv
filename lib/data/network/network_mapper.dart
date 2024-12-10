import 'package:logger/logger.dart';
import 'package:play_tv/data/network/entity/trending_videos_entity.dart';
import 'package:play_tv/domain/exception/mapper_exception.dart';
import 'package:play_tv/domain/model/trending_videos.dart';

class NetworkMapper {
  final Logger logger;

  NetworkMapper({
    required this.logger,
  });

  TrendingVideos toTrendingVideos(TrendingVideosEntity trendingVideosEntity) {
    try {
      return TrendingVideos(
        path: trendingVideosEntity.path,
        perPage: trendingVideosEntity.perPage,
        nextCursor: trendingVideosEntity.nextCursor,
        nextPageUrl: trendingVideosEntity.nextPageUrl,
        prevCursor: trendingVideosEntity.prevCursor,
        prevPageUrl: trendingVideosEntity.prevPageUrl,
        ulids: trendingVideosEntity.ulids,
      );
    } catch (e) {
      throw MapperException<TrendingVideosEntity, TrendingVideos>('Failed to map trending videos');
    }
  }

  List<TrendingVideos> toTrendingVideosList(List<TrendingVideosEntity> entities) {
    print('entities: ${entities.length}');
    print('entities: ${entities.first.toJson()}');
    final trendingVideosList = <TrendingVideos>[];

    for (final entity in entities) {
      try {
        trendingVideosList.add(toTrendingVideos(entity));
      } catch (e) {
        logger.w('Failed to map trending videos', error: e);
      }
    }

    return trendingVideosList;
  }
}
