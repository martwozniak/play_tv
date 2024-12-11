import 'package:json_annotation/json_annotation.dart';

part 'video_entity.g.dart';

@JsonSerializable()
class VideoEntity {
    List<SingleVideoEntity> data;

    VideoEntity({
        required this.data,
    });

    factory VideoEntity.fromJson(Map<String, dynamic> json) => _$VideoEntityFromJson(json);
    Map<String, dynamic> toJson() => _$VideoEntityToJson(this);

}

@JsonSerializable()
class SingleVideoEntity {
    String id;
    dynamic rootUlid;
    dynamic parentUlid;
    dynamic grandparentUlid;
    bool isSensitive;
    bool isPrivate;
    bool commentsEnabled;
    bool downloadEnabled;
    bool isTrolling;
    String? body;
    String? detectedLanguage;
    String? username;
    User? user;
    PostType? postType;
    String? title;
    List<SingleVideo>? videos;
    dynamic videoProcessing;
    List<Tag>? tags;
    bool? edited;
    dynamic userReaction;
    bool? isRepost;
    bool? isRepostWithComment;
    dynamic embedUrl;
    String? groupName;
    String? groupId;
    String? support;
    DateTime createdAt;
    DateTime updatedAt;
    bool isDeleted;
    dynamic isHidden;
    bool isProcessing;
    UserEngagement? userEngagement;
    PostEngagement? postEngagement;

    SingleVideoEntity({
        required this.id,
        required this.rootUlid,
        required this.parentUlid,
        required this.grandparentUlid,
        required this.isSensitive,
        required this.isPrivate,
        required this.commentsEnabled,
        required this.downloadEnabled,
        required this.isTrolling,
        required this.body,
        required this.detectedLanguage,
        required this.username,
        required this.user,
        required this.postType,
        required this.title,
        required this.videos,
        required this.videoProcessing,
        required this.tags,
        required this.edited,
        required this.userReaction,
        required this.isRepost,
        required this.isRepostWithComment,
        required this.embedUrl,
        required this.groupName,
        required this.groupId,
        required this.support,
        required this.createdAt,
        required this.updatedAt,
        required this.isDeleted,
        required this.isHidden,
        required this.isProcessing,
        required this.userEngagement,
        required this.postEngagement,
    });

}

@JsonSerializable()
class PostEngagement {
    int totalCommentCount;
    int commentCount;
    int views;
    List<Reaction> reactions;

    PostEngagement({
        required this.totalCommentCount,
        required this.commentCount,
        required this.views,
        required this.reactions,
    });

}

@JsonSerializable()
class Reaction {
    Name name;
    int count;

    Reaction({
        required this.name,
        required this.count,
    });

}

enum Name {
    HEART,
    THUMBS_DOWN,
    THUMBS_UP
}

enum PostType {
    VIDEO
}

@JsonSerializable()
class Tag {
    String name;

    Tag({
        required this.name,
    });

}
@JsonSerializable()
class User {
    String userId;
    String avatar;
    DateTime updatedAt;
    int updatedAtEpoch;

    User({
        required this.userId,
        required this.avatar,
        required this.updatedAt,
        required this.updatedAtEpoch,
    });

}

@JsonSerializable()
class UserEngagement {
    dynamic hasReposted;
    dynamic hasRepostedWithComment;
    dynamic hasCommented;

    UserEngagement({
        required this.hasReposted,
        required this.hasRepostedWithComment,
        required this.hasCommented,
    });

}

@JsonSerializable()
class VideoProcessingClass {
    String id;
    String tmpUrl;
    VideoClass video;
    VideoClass thumbnail;
    bool isProcessing;
    DateTime createdAt;
    DateTime updatedAt;

    VideoProcessingClass({
        required this.id,
        required this.tmpUrl,
        required this.video,
        required this.thumbnail,
        required this.isProcessing,
        required this.createdAt,
        required this.updatedAt,
    });

}
@JsonSerializable()
class VideoClass {
    String url;
    int? widthPx;
    int? heightPx;
    ThumbnailMimeType? mimeType;
    dynamic duration;

    VideoClass({
        required this.url,
        required this.widthPx,
        required this.heightPx,
        required this.mimeType,
        this.duration,
    });

}

enum ThumbnailMimeType {
    IMAGE_JPEG
}

@JsonSerializable()
class SingleVideo {
    String url;
    int? widthPx;
    int? heightPx;
    PurpleMimeType mimeType;
    int duration;
    int? lastPosition;
    VideoThumbnail thumbnail;

    SingleVideo({
        required this.url,
        required this.widthPx,
        required this.heightPx,
        required this.mimeType,
        required this.duration,
        required this.lastPosition,
        required this.thumbnail,
    });

}

enum PurpleMimeType {
    VIDEO_MP4
}

@JsonSerializable()
class VideoThumbnail {
    String url;
    String m3U8Name;
    String dashName;
    int widthPx;
    int heightPx;
    ThumbnailMimeType mimeType;

    VideoThumbnail({
        required this.url,
        required this.m3U8Name,
        required this.dashName,
        required this.widthPx,
        required this.heightPx,
        required this.mimeType,
    });

}
