// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_videos_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendingVideosEntity _$TrendingVideosEntityFromJson(Map<String, dynamic> json) => TrendingVideosEntity(
      path: json['path'] as String,
      perPage: (json['perPage'] as num).toInt(),
      nextCursor: json['nextCursor'] as String,
      nextPageUrl: json['nextPageUrl'] as String,
      prevCursor: json['prevCursor'],
      prevPageUrl: json['prevPageUrl'],
      ulids: (json['ulids'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$TrendingVideosEntityToJson(TrendingVideosEntity instance) => <String, dynamic>{
      'path': instance.path,
      'perPage': instance.perPage,
      'nextCursor': instance.nextCursor,
      'nextPageUrl': instance.nextPageUrl,
      'prevCursor': instance.prevCursor,
      'prevPageUrl': instance.prevPageUrl,
      'ulids': instance.ulids,
    };
