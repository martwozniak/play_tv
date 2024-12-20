// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      data: (json['data'] as List<dynamic>).map((e) => User.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) => <String, dynamic>{
      'data': instance.data,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      ulid: json['ulid'] as String? ?? '',
      name: json['name'] as String? ?? '',
      username: json['username'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
      bio: json['bio'] as String? ?? '',
      website: json['website'] as String? ?? '',
      websiteName: json['website_name'] as String? ?? '',
      background: json['background'] as String? ?? '',
      badges: json['badges'] as List<dynamic>? ?? [],
      followers: (json['followers'] as num?)?.toInt() ?? 0,
      following: (json['following'] as num?)?.toInt() ?? 0,
      friendCount: (json['friendCount'] as num?)?.toInt() ?? 0,
      postCount: (json['postCount'] as num?)?.toInt() ?? 0,
      videoCount: (json['videoCount'] as num?)?.toInt() ?? 0,
      burstCount: (json['burstCount'] as num?)?.toInt() ?? 0,
      emailVerified: DateTime.parse(json['emailVerified'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      updatedAtEpoch: (json['updatedAtEpoch'] as num?)?.toInt() ?? 0,
      profileEngagement: json['ProfileEngagement'] as List<dynamic>? ?? [],
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'ulid': instance.ulid,
      'name': instance.name,
      'username': instance.username,
      'avatar': instance.avatar,
      'bio': instance.bio,
      'website': instance.website,
      'website_name': instance.websiteName,
      'background': instance.background,
      'badges': instance.badges,
      'followers': instance.followers,
      'following': instance.following,
      'friendCount': instance.friendCount,
      'postCount': instance.postCount,
      'videoCount': instance.videoCount,
      'burstCount': instance.burstCount,
      'emailVerified': instance.emailVerified.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'updatedAtEpoch': instance.updatedAtEpoch,
      'ProfileEngagement': instance.profileEngagement,
    };
