import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity {
  final List<User> data;

  UserEntity({
    required this.data,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      data: (json['data'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(defaultValue: '')
  final String ulid;
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String username;
  @JsonKey(defaultValue: '')
  final String avatar;
  @JsonKey(defaultValue: '')
  final String bio;
  @JsonKey(defaultValue: '')
  final String website;
  @JsonKey(name: 'website_name', defaultValue: '')
  final String websiteName;
  @JsonKey(defaultValue: '')
  final String background;
  @JsonKey(defaultValue: <dynamic>[])
  final List<dynamic> badges;
  @JsonKey(defaultValue: 0)
  final int followers;
  @JsonKey(defaultValue: 0)
  final int following;
  @JsonKey(defaultValue: 0)
  final int friendCount;
  @JsonKey(defaultValue: 0)
  final int postCount;
  @JsonKey(defaultValue: 0)
  final int videoCount;
  @JsonKey(defaultValue: 0)
  final int burstCount;
  final DateTime emailVerified;
  final DateTime updatedAt;
  @JsonKey(defaultValue: 0)
  final int updatedAtEpoch;
  @JsonKey(name: 'ProfileEngagement', defaultValue: <dynamic>[])
  final List<dynamic> profileEngagement;

  User({
    required this.ulid,
    required this.name,
    required this.username,
    required this.avatar,
    required this.bio,
    required this.website,
    required this.websiteName,
    required this.background,
    required this.badges,
    required this.followers,
    required this.following,
    required this.friendCount,
    required this.postCount,
    required this.videoCount,
    required this.burstCount,
    required this.emailVerified,
    required this.updatedAt,
    required this.updatedAtEpoch,
    required this.profileEngagement,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson({
      ...json,
      'emailVerified':
          json['emailVerified'] ?? DateTime.now().toIso8601String(),
      'updatedAt': json['updatedAt'] ?? DateTime.now().toIso8601String(),
    });
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
