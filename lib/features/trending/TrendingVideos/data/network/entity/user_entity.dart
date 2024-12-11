import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity {
    List<User> data;

    UserEntity({
        required this.data,
    });

    factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);
    Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
@JsonSerializable()
class User {
    String ulid;
    String name;
    String username;
    String avatar;
    String bio;
    String website;
    String websiteName;
    String background;
    List<dynamic> badges;
    int followers;
    int following;
    int friendCount;
    int postCount;
    int videoCount;
    int burstCount;
    DateTime emailVerified;
    DateTime updatedAt;
    int updatedAtEpoch;
    List<dynamic> profileEngagement;

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

    factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
    Map<String, dynamic> toJson() => _$UserToJson(this);

}
