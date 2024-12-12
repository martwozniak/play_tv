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
  dynamic id;
  dynamic rootUlid;
  dynamic parentUlid;
  dynamic grandparentUlid;
  bool isSensitive;
  bool isPrivate;
  bool commentsEnabled;
  bool downloadEnabled;
  bool isTrolling;
  String body;
  dynamic detectedLanguage;
  dynamic username;
  User user;
  dynamic postType;
  String? title;
  List<SingleVideo> videos;
  dynamic videoProcessing;
  List<Tag> tags;
  bool edited;
  dynamic userReaction;
  bool isRepost;
  bool isRepostWithComment;
  dynamic embedUrl;
  dynamic groupName;
  dynamic groupId;
  dynamic support;
  DateTime createdAt;
  DateTime updatedAt;
  bool isDeleted;
  dynamic isHidden;
  bool isProcessing;
  UserEngagement userEngagement;
  PostEngagement postEngagement;

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

  factory SingleVideoEntity.fromJson(Map<String, dynamic> json) => _$SingleVideoEntityFromJson(json);
  Map<String, dynamic> toJson() => _$SingleVideoEntityToJson(this);
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

  factory PostEngagement.fromJson(Map<String, dynamic> json) => _$PostEngagementFromJson(json);
  Map<String, dynamic> toJson() => _$PostEngagementToJson(this);
}

@JsonSerializable()
class Reaction {
  String? name;
  int count;

  Reaction({
    required this.name,
    required this.count,
  });

  factory Reaction.fromJson(Map<String, dynamic> json) => _$ReactionFromJson(json);
  Map<String, dynamic> toJson() => _$ReactionToJson(this);
}

@JsonSerializable()
class Tag {
  String name;

  Tag({
    required this.name,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
  Map<String, dynamic> toJson() => _$TagToJson(this);
}

@JsonSerializable()
class User {
  dynamic userId;
  dynamic avatar;
  DateTime updatedAt;
  int updatedAtEpoch;

  User({
    required this.userId,
    required this.avatar,
    required this.updatedAt,
    required this.updatedAtEpoch,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
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

  factory UserEngagement.fromJson(Map<String, dynamic> json) => _$UserEngagementFromJson(json);
  Map<String, dynamic> toJson() => _$UserEngagementToJson(this);
}

@JsonSerializable()
class VideoProcessingClass {
  dynamic id;
  dynamic tmpUrl;
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

  factory VideoProcessingClass.fromJson(Map<String, dynamic> json) => _$VideoProcessingClassFromJson(json);
  Map<String, dynamic> toJson() => _$VideoProcessingClassToJson(this);
}

@JsonSerializable()
class VideoClass {
  dynamic url;
  int? widthPx;
  int? heightPx;
  dynamic mimeType;
  dynamic duration;

  VideoClass({
    required this.url,
    required this.widthPx,
    required this.heightPx,
    required this.mimeType,
    this.duration,
  });

  factory VideoClass.fromJson(Map<String, dynamic> json) => _$VideoClassFromJson(json);
  Map<String, dynamic> toJson() => _$VideoClassToJson(this);
}

@JsonSerializable()
class SingleVideo {
  dynamic url;
  int? widthPx;
  int? heightPx;
  dynamic mimeType;
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

  factory SingleVideo.fromJson(Map<String, dynamic> json) => _$SingleVideoFromJson(json);
  Map<String, dynamic> toJson() => _$SingleVideoToJson(this);
}

@JsonSerializable()
class VideoThumbnail {
  String url;
  dynamic m3U8Name;
  dynamic dashName;
  int widthPx;
  int heightPx;
  dynamic mimeType;

  VideoThumbnail({
    required this.url,
    required this.m3U8Name,
    required this.dashName,
    required this.widthPx,
    required this.heightPx,
    required this.mimeType,
  });

  factory VideoThumbnail.fromJson(Map<String, dynamic> json) => _$VideoThumbnailFromJson(json);
  Map<String, dynamic> toJson() => _$VideoThumbnailToJson(this);
}
