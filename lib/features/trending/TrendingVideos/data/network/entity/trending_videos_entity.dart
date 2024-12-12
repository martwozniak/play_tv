// To parse this JSON data, do
//
//     final TrendingVideosEntity = TrendingVideosEntityFromJson(jsonString);
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'trending_videos_entity.g.dart';

TrendingVideosEntity TrendingVideosEntityFromJson(String str) {
  final jsonMap = json.decode(str);
  if (jsonMap is Map<String, dynamic>) {
    return TrendingVideosEntity.fromJson(jsonMap);
  } else {
    throw const FormatException('Invalid JSON format');
  }
}

String TrendingVideosEntityToJson(TrendingVideosEntity data) => json.encode(data.toJson());

@JsonSerializable()
class TrendingVideosEntity {
  String path;
  int perPage;
  String nextCursor;
  String nextPageUrl;
  dynamic prevCursor;
  dynamic prevPageUrl;
  List<String> ulids;

  TrendingVideosEntity({
    required this.path,
    required this.perPage,
    required this.nextCursor,
    required this.nextPageUrl,
    required this.prevCursor,
    required this.prevPageUrl,
    required this.ulids,
  });

  factory TrendingVideosEntity.fromJson(Map<String, dynamic> json) => TrendingVideosEntity(
        path: json["path"] as String,
        perPage: json["per_page"] as int,
        nextCursor: json["next_cursor"] as String,
        nextPageUrl: json["next_page_url"] as String,
        prevCursor: json["prev_cursor"],
        prevPageUrl: json["prev_page_url"],
        ulids: List<String>.from(json["ulids"] as List<dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "per_page": perPage,
        "next_cursor": nextCursor,
        "next_page_url": nextPageUrl,
        "prev_cursor": prevCursor,
        "prev_page_url": prevPageUrl,
        "ulids": List<dynamic>.from(ulids.map((x) => x)),
      };
}
