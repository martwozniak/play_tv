// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoEntity _$VideoEntityFromJson(Map<String, dynamic> json) => VideoEntity(
      data: (json['data'] as List<dynamic>)
          .map((e) => SingleVideoEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VideoEntityToJson(VideoEntity instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

SingleVideoEntity _$SingleVideoEntityFromJson(Map<String, dynamic> json) =>
    SingleVideoEntity(
      id: json['id'] as String,
      rootUlid: json['rootUlid'],
      parentUlid: json['parentUlid'],
      grandparentUlid: json['grandparentUlid'],
      isSensitive: json['isSensitive'] as bool,
      isPrivate: json['isPrivate'] as bool,
      commentsEnabled: json['commentsEnabled'] as bool,
      downloadEnabled: json['downloadEnabled'] as bool,
      isTrolling: json['isTrolling'] as bool,
      body: json['body'] as String?,
      detectedLanguage: json['detectedLanguage'] as String?,
      username: json['username'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      postType: json['postType'],
      title: json['title'] as String?,
      videos: (json['videos'] as List<dynamic>?)
          ?.map((e) => SingleVideo.fromJson(e as Map<String, dynamic>))
          .toList(),
      videoProcessing: json['videoProcessing'],
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      edited: json['edited'] as bool?,
      userReaction: json['userReaction'],
      isRepost: json['isRepost'] as bool?,
      isRepostWithComment: json['isRepostWithComment'] as bool?,
      embedUrl: json['embedUrl'],
      groupName: json['groupName'] as String?,
      groupId: json['groupId'] as String?,
      support: json['support'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      isDeleted: json['isDeleted'] as bool,
      isHidden: json['isHidden'],
      isProcessing: json['isProcessing'] as bool,
      userEngagement: json['userEngagement'] == null
          ? null
          : UserEngagement.fromJson(
              json['userEngagement'] as Map<String, dynamic>),
      postEngagement: json['postEngagement'] == null
          ? null
          : PostEngagement.fromJson(
              json['postEngagement'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SingleVideoEntityToJson(SingleVideoEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rootUlid': instance.rootUlid,
      'parentUlid': instance.parentUlid,
      'grandparentUlid': instance.grandparentUlid,
      'isSensitive': instance.isSensitive,
      'isPrivate': instance.isPrivate,
      'commentsEnabled': instance.commentsEnabled,
      'downloadEnabled': instance.downloadEnabled,
      'isTrolling': instance.isTrolling,
      'body': instance.body,
      'detectedLanguage': instance.detectedLanguage,
      'username': instance.username,
      'user': instance.user,
      'postType': instance.postType,
      'title': instance.title,
      'videos': instance.videos,
      'videoProcessing': instance.videoProcessing,
      'tags': instance.tags,
      'edited': instance.edited,
      'userReaction': instance.userReaction,
      'isRepost': instance.isRepost,
      'isRepostWithComment': instance.isRepostWithComment,
      'embedUrl': instance.embedUrl,
      'groupName': instance.groupName,
      'groupId': instance.groupId,
      'support': instance.support,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'isHidden': instance.isHidden,
      'isProcessing': instance.isProcessing,
      'userEngagement': instance.userEngagement,
      'postEngagement': instance.postEngagement,
    };

PostEngagement _$PostEngagementFromJson(Map<String, dynamic> json) =>
    PostEngagement(
      totalCommentCount: (json['totalCommentCount'] as num).toInt(),
      commentCount: (json['commentCount'] as num).toInt(),
      views: (json['views'] as num).toInt(),
      reactions: (json['reactions'] as List<dynamic>)
          .map((e) => Reaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostEngagementToJson(PostEngagement instance) =>
    <String, dynamic>{
      'totalCommentCount': instance.totalCommentCount,
      'commentCount': instance.commentCount,
      'views': instance.views,
      'reactions': instance.reactions,
    };

Reaction _$ReactionFromJson(Map<String, dynamic> json) => Reaction(
      name: json['name'],
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$ReactionToJson(Reaction instance) => <String, dynamic>{
      'name': instance.name,
      'count': instance.count,
    };

Tag _$TagFromJson(Map<String, dynamic> json) => Tag(
      name: json['name'] as String,
    );

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'name': instance.name,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      userId: json['userId'] as String,
      avatar: json['avatar'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      updatedAtEpoch: (json['updatedAtEpoch'] as num).toInt(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userId': instance.userId,
      'avatar': instance.avatar,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'updatedAtEpoch': instance.updatedAtEpoch,
    };

UserEngagement _$UserEngagementFromJson(Map<String, dynamic> json) =>
    UserEngagement(
      hasReposted: json['hasReposted'],
      hasRepostedWithComment: json['hasRepostedWithComment'],
      hasCommented: json['hasCommented'],
    );

Map<String, dynamic> _$UserEngagementToJson(UserEngagement instance) =>
    <String, dynamic>{
      'hasReposted': instance.hasReposted,
      'hasRepostedWithComment': instance.hasRepostedWithComment,
      'hasCommented': instance.hasCommented,
    };

VideoProcessingClass _$VideoProcessingClassFromJson(
        Map<String, dynamic> json) =>
    VideoProcessingClass(
      id: json['id'] as String,
      tmpUrl: json['tmpUrl'] as String,
      video: VideoClass.fromJson(json['video'] as Map<String, dynamic>),
      thumbnail: VideoClass.fromJson(json['thumbnail'] as Map<String, dynamic>),
      isProcessing: json['isProcessing'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$VideoProcessingClassToJson(
        VideoProcessingClass instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tmpUrl': instance.tmpUrl,
      'video': instance.video,
      'thumbnail': instance.thumbnail,
      'isProcessing': instance.isProcessing,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

VideoClass _$VideoClassFromJson(Map<String, dynamic> json) => VideoClass(
      url: json['url'] as String,
      widthPx: (json['widthPx'] as num?)?.toInt(),
      heightPx: (json['heightPx'] as num?)?.toInt(),
      mimeType: json['mimeType'],
      duration: json['duration'],
    );

Map<String, dynamic> _$VideoClassToJson(VideoClass instance) =>
    <String, dynamic>{
      'url': instance.url,
      'widthPx': instance.widthPx,
      'heightPx': instance.heightPx,
      'mimeType': instance.mimeType,
      'duration': instance.duration,
    };

SingleVideo _$SingleVideoFromJson(Map<String, dynamic> json) => SingleVideo(
      url: json['url'] as String,
      widthPx: (json['widthPx'] as num?)?.toInt(),
      heightPx: (json['heightPx'] as num?)?.toInt(),
      mimeType: $enumDecode(_$PurpleMimeTypeEnumMap, json['mimeType']),
      duration: (json['duration'] as num).toInt(),
      lastPosition: (json['lastPosition'] as num?)?.toInt(),
      thumbnail:
          VideoThumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SingleVideoToJson(SingleVideo instance) =>
    <String, dynamic>{
      'url': instance.url,
      'widthPx': instance.widthPx,
      'heightPx': instance.heightPx,
      'mimeType': _$PurpleMimeTypeEnumMap[instance.mimeType]!,
      'duration': instance.duration,
      'lastPosition': instance.lastPosition,
      'thumbnail': instance.thumbnail,
    };

const _$PurpleMimeTypeEnumMap = {
  PurpleMimeType.VIDEO_MP4: 'VIDEO_MP4',
};

VideoThumbnail _$VideoThumbnailFromJson(Map<String, dynamic> json) =>
    VideoThumbnail(
      url: json['url'] as String,
      m3U8Name: json['m3U8Name'] as String,
      dashName: json['dashName'] as String,
      widthPx: (json['widthPx'] as num).toInt(),
      heightPx: (json['heightPx'] as num).toInt(),
      mimeType: json['mimeType'],
    );

Map<String, dynamic> _$VideoThumbnailToJson(VideoThumbnail instance) =>
    <String, dynamic>{
      'url': instance.url,
      'm3U8Name': instance.m3U8Name,
      'dashName': instance.dashName,
      'widthPx': instance.widthPx,
      'heightPx': instance.heightPx,
      'mimeType': instance.mimeType,
    };
