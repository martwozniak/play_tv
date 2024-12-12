import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String ulid,
    required String name,
    required String username,
    required String avatar,
    required String? bio,
    required String? website,
    required String? websiteName,
    required String? background,
    required List<dynamic>? badges,
    required int followers,
    required int following,
    required int friendCount,
    required int postCount,
    required int videoCount,
    required int burstCount,
    required DateTime emailVerified,
    required DateTime updatedAt,
    required int updatedAtEpoch,
    required List<dynamic>? profileEngagement,
  }) = _User;
}
