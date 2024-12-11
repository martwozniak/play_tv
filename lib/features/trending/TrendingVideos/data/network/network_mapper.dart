import 'package:logger/logger.dart';
import 'package:play_tv/features/trending/TrendingVideos/data/network/entity/trending_videos_entity.dart';
import 'package:play_tv/features/trending/TrendingVideos/data/network/entity/video_entity.dart' as entity;
import 'package:play_tv/features/trending/TrendingVideos/domain/exception/mapper_exception.dart';
import 'package:play_tv/features/trending/TrendingVideos/domain/model/trending_videos.dart';
import 'package:play_tv/features/trending/TrendingVideos/domain/model/video.dart';

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


  Video toVideo(entity.VideoEntity videoEntity) {
    try {
      if (videoEntity.data.isEmpty) {
        throw MapperException<entity.VideoEntity, Video>('VideoEntity data is empty');
      }
      
      final singleVideoEntity = videoEntity.data.first;
      return Video(
        id: singleVideoEntity.id,
        rootUlid: singleVideoEntity.rootUlid?.toString() ?? '',
        parentUlid: singleVideoEntity.parentUlid?.toString() ?? '',
        grandparentUlid: singleVideoEntity.grandparentUlid?.toString() ?? '',
        isSensitive: singleVideoEntity.isSensitive,
        isPrivate: singleVideoEntity.isPrivate,
        commentsEnabled: singleVideoEntity.commentsEnabled,
        downloadEnabled: singleVideoEntity.downloadEnabled,
        isTrolling: singleVideoEntity.isTrolling,
        body: singleVideoEntity.body ?? '',
        detectedLanguage: singleVideoEntity.detectedLanguage ?? '',
        username: singleVideoEntity.username,
        user: User(
          userId: singleVideoEntity.user.userId,
          avatar: singleVideoEntity.user.avatar,
          updatedAt: singleVideoEntity.user.updatedAt,
          updatedAtEpoch: singleVideoEntity.user.updatedAtEpoch,
        ),
        postType: singleVideoEntity.postType ?? '',
        title: singleVideoEntity.title ?? '',
        videos: singleVideoEntity.videos.map((video) => SingleVideo(
          url: video.url,
          widthPx: video.widthPx,
          heightPx: video.heightPx,
          mimeType: video.mimeType,
          duration: video.duration,
          lastPosition: video.lastPosition,
          thumbnail: VideoThumbnail(
            url: video.thumbnail.url,
            widthPx: video.thumbnail.widthPx,
            heightPx: video.thumbnail.heightPx,
            mimeType: video.thumbnail.mimeType,
          ),
        )).toList(),
        videoProcessing: singleVideoEntity.videoProcessing,
        tags: singleVideoEntity.tags.map((tag) => Tag(name: tag.name ?? '')).toList(),
        edited: singleVideoEntity.edited,
        userReaction: singleVideoEntity.userReaction,
        isRepost: singleVideoEntity.isRepost,
        isRepostWithComment: singleVideoEntity.isRepostWithComment,
        embedUrl: singleVideoEntity.embedUrl ?? '',
        postEngagement: PostEngagement(
          totalCommentCount: singleVideoEntity.postEngagement.totalCommentCount,
          commentCount: singleVideoEntity.postEngagement.commentCount,
          views: singleVideoEntity.postEngagement.views,
          reactions: singleVideoEntity.postEngagement.reactions.map((reaction) => Reaction(name: reaction.name ?? '', count: reaction.count)).toList(),
        ),
        userEngagement: UserEngagement(
          hasReposted: singleVideoEntity.userEngagement.hasReposted,
          hasRepostedWithComment: singleVideoEntity.userEngagement.hasRepostedWithComment,
          hasCommented: singleVideoEntity.userEngagement.hasCommented,
        ),
        createdAt: singleVideoEntity.createdAt,
        updatedAt: singleVideoEntity.updatedAt,
        isDeleted: singleVideoEntity.isDeleted,
        groupName: singleVideoEntity.groupName ?? '',
        groupId: singleVideoEntity.groupId ?? '',
        support: singleVideoEntity.support ?? '',
        isHidden: singleVideoEntity.isHidden,
        isProcessing: singleVideoEntity.isProcessing,
      );
    } catch (e) {
      throw MapperException<entity.VideoEntity, Video>('Failed to map VideoEntity to Video: $e');
    }
  }

  List<Video> toVideos(List<entity.VideoEntity> videoEntities) {
    final videoList = <Video>[];
    for (final entity in videoEntities) {
      if (entity.data.isNotEmpty) {
        try {
          videoList.add(toVideo(entity));
        } catch (e) {
          logger.w('Failed to map VideoEntity to Video: $e');
        }
      } else {
        logger.w('Skipping mapping of empty VideoEntity');
      }
    }
    return videoList;
  }
}
