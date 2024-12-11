import 'package:freezed_annotation/freezed_annotation.dart';

part 'trending_videos.freezed.dart';

@freezed
class TrendingVideos with _$TrendingVideos {
  const factory TrendingVideos({
    required String path,
    required int perPage,
    required String nextCursor,
    required String nextPageUrl,
    required dynamic prevCursor,
    required dynamic prevPageUrl,
    required List<String> ulids,
  }) = _TrendingVideos;
}
