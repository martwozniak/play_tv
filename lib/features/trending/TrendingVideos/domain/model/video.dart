import 'package:freezed_annotation/freezed_annotation.dart';

part 'video.freezed.dart';

@freezed
class Video with _$Video {
  const factory Video({
        required String id,
        required String? rootUlid,
        required String? parentUlid, 
        required String? grandparentUlid,
        required bool isSensitive,
        required bool isPrivate,
        required bool commentsEnabled,
        required bool downloadEnabled,
        required bool isTrolling,
        required String? body,
        required String? detectedLanguage,
        required String? username,
        required User? user,
        required String? postType,
        required String? title,
        required List<SingleVideo>? videos,
        required dynamic videoProcessing,
        required List<Tag>? tags,
        required bool? edited,
        required dynamic userReaction,
        required bool? isRepost,
        required bool? isRepostWithComment,
        required dynamic embedUrl,
        required String? groupName,
        required String? groupId,
        required String? support,
        required DateTime? createdAt,
        required DateTime? updatedAt,
        required bool? isDeleted,
        required dynamic isHidden,
        required bool? isProcessing,
        required UserEngagement? userEngagement,
        required PostEngagement? postEngagement,
  }) = _Video;
}

@freezed
class User with _$User {
    const factory User({
        required String? userId,
        required String? avatar,
        required DateTime updatedAt,
        required int updatedAtEpoch,
  }) = _User;
  }

@freezed
class Tag with _$Tag {
    const factory Tag({
        required String? name,
    }) = _Tag;
}

@freezed
class UserEngagement with _$UserEngagement {
    const factory UserEngagement({
        required dynamic hasReposted,
        required dynamic hasRepostedWithComment,
        required dynamic hasCommented,
  }) = _UserEngagement;
}

@freezed
class PostEngagement with _$PostEngagement {
    const factory PostEngagement({
        required int totalCommentCount,
        required int commentCount,
        required int views,
        required List<Reaction> reactions,
  }) = _PostEngagement;
}

enum ReactionName {
    HEART,
    THUMBS_DOWN,
    THUMBS_UP
}

@freezed
class Reaction with _$Reaction {
    const factory Reaction({
        required ReactionName name,
        required int count,
    }) = _Reaction;
}

@freezed
class SingleVideo with _$SingleVideo {
    const factory SingleVideo({
        required String? url,
        required int? widthPx,
        required int? heightPx,
        required String? mimeType,
        required int duration,
        required int? lastPosition,
        required VideoThumbnail thumbnail,
    }) = _SingleVideo;
}

@freezed
class VideoThumbnail with _$VideoThumbnail {
    const factory VideoThumbnail({
        required String? url,
        required int? widthPx,
        required int? heightPx,
        required ThumbnailMimeType mimeType,
    }) = _VideoThumbnail;
}

enum ThumbnailMimeType {
    IMAGE_JPEG
}