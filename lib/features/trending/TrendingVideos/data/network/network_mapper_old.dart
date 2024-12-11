import 'package:logger/logger.dart';
import 'package:play_tv/features/trending/TrendingVideos/data/network/entity/video_entity.dart' as entity;
import 'package:play_tv/features/trending/TrendingVideos/domain/model/video.dart';

class NetworkMapper {
  final Logger logger;

  NetworkMapper({
    required this.logger,
  });

  Video toVideo(entity.VideoEntity videoEntity) {
    try {
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
        body: singleVideoEntity.body,
        detectedLanguage: singleVideoEntity.detectedLanguage,
        username: singleVideoEntity.username,
        user: User(
          userId: singleVideoEntity.user.userId,
          avatar: singleVideoEntity.user.avatar,
          updatedAt: singleVideoEntity.user.updatedAt,
          updatedAtEpoch: singleVideoEntity.user.updatedAtEpoch,
        ),
        postType: singleVideoEntity.postType.name,
        title: singleVideoEntity.title,
        videos: singleVideoEntity.videos.map((video) => SingleVideo(
          url: video.url,
          widthPx: video.widthPx,
          heightPx: video.heightPx,
          mimeType: PurpleMimeType.values.firstWhere((e) => e.name == video.mimeType.name),
          duration: video.duration,
          lastPosition: video.lastPosition,
          thumbnail: VideoThumbnail(
            url: video.thumbnail.url,
            widthPx: video.thumbnail.widthPx,
            heightPx: video.thumbnail.heightPx,
            mimeType: ThumbnailMimeType.values.firstWhere((e) => e.name == video.thumbnail.mimeType.name),
          ),
        )).toList(),
        videoProcessing: singleVideoEntity.videoProcessing,
        tags: singleVideoEntity.tags.map((tag) => Tag(name: tag.name)).toList(),
        edited: singleVideoEntity.edited,
        userReaction: singleVideoEntity.userReaction,
        isRepost: singleVideoEntity.isRepost,
        isRepostWithComment: singleVideoEntity.isRepostWithComment,
        embedUrl: singleVideoEntity.embedUrl,
        postEngagement: PostEngagement(
          totalCommentCount: singleVideoEntity.postEngagement.totalCommentCount,
          commentCount: singleVideoEntity.postEngagement.commentCount,
          views: singleVideoEntity.postEngagement.views,
          reactions: singleVideoEntity.postEngagement.reactions.map((reaction) => Reaction(name: ReactionName.values.firstWhere((e) => e.name == reaction.name), count: reaction.count)).toList(),
        ),
        userEngagement: UserEngagement(
          hasReposted: singleVideoEntity.userEngagement.hasReposted,
          hasRepostedWithComment: singleVideoEntity.userEngagement.hasRepostedWithComment,
          hasCommented: singleVideoEntity.userEngagement.hasCommented,
        ),
        createdAt: singleVideoEntity.createdAt,
        updatedAt: singleVideoEntity.updatedAt,
        isDeleted: singleVideoEntity.isDeleted,
        groupName: singleVideoEntity.groupName,
        groupId: singleVideoEntity.groupId,
        support: singleVideoEntity.support,
        isHidden: singleVideoEntity.isHidden,
        isProcessing: singleVideoEntity.isProcessing,
      );
    } catch (e) {
      throw MapperException<entity.VideoEntity, Video>(
          'Failed to map SingleVideoEntity to Video: $e');
    }
  }

  List<Video> toVideos(List<entity.VideoEntity> singleVideoEntities) {
    final videos = <Video>[];
    for (final singleVideoEntity in singleVideoEntities) {
      try {
        videos.add(toVideo(singleVideoEntity));
      } catch (e) {
        logger.w('Failed to map SingleVideoEntity to Video', error: e);
      }
    }
    return videos;
  }
}

