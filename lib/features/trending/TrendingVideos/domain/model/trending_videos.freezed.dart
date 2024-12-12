// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trending_videos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TrendingVideos {
  String get path => throw _privateConstructorUsedError;
  int get perPage => throw _privateConstructorUsedError;
  String get nextCursor => throw _privateConstructorUsedError;
  String get nextPageUrl => throw _privateConstructorUsedError;
  dynamic get prevCursor => throw _privateConstructorUsedError;
  dynamic get prevPageUrl => throw _privateConstructorUsedError;
  List<String> get ulids => throw _privateConstructorUsedError;

  /// Create a copy of TrendingVideos
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrendingVideosCopyWith<TrendingVideos> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrendingVideosCopyWith<$Res> {
  factory $TrendingVideosCopyWith(TrendingVideos value, $Res Function(TrendingVideos) then) =
      _$TrendingVideosCopyWithImpl<$Res, TrendingVideos>;
  @useResult
  $Res call(
      {String path,
      int perPage,
      String nextCursor,
      String nextPageUrl,
      dynamic prevCursor,
      dynamic prevPageUrl,
      List<String> ulids});
}

/// @nodoc
class _$TrendingVideosCopyWithImpl<$Res, $Val extends TrendingVideos> implements $TrendingVideosCopyWith<$Res> {
  _$TrendingVideosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrendingVideos
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? perPage = null,
    Object? nextCursor = null,
    Object? nextPageUrl = null,
    Object? prevCursor = freezed,
    Object? prevPageUrl = freezed,
    Object? ulids = null,
  }) {
    return _then(_value.copyWith(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      nextCursor: null == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String,
      nextPageUrl: null == nextPageUrl
          ? _value.nextPageUrl
          : nextPageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      prevCursor: freezed == prevCursor
          ? _value.prevCursor
          : prevCursor // ignore: cast_nullable_to_non_nullable
              as dynamic,
      prevPageUrl: freezed == prevPageUrl
          ? _value.prevPageUrl
          : prevPageUrl // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ulids: null == ulids
          ? _value.ulids
          : ulids // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrendingVideosImplCopyWith<$Res> implements $TrendingVideosCopyWith<$Res> {
  factory _$$TrendingVideosImplCopyWith(_$TrendingVideosImpl value, $Res Function(_$TrendingVideosImpl) then) =
      __$$TrendingVideosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String path,
      int perPage,
      String nextCursor,
      String nextPageUrl,
      dynamic prevCursor,
      dynamic prevPageUrl,
      List<String> ulids});
}

/// @nodoc
class __$$TrendingVideosImplCopyWithImpl<$Res> extends _$TrendingVideosCopyWithImpl<$Res, _$TrendingVideosImpl>
    implements _$$TrendingVideosImplCopyWith<$Res> {
  __$$TrendingVideosImplCopyWithImpl(_$TrendingVideosImpl _value, $Res Function(_$TrendingVideosImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrendingVideos
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? perPage = null,
    Object? nextCursor = null,
    Object? nextPageUrl = null,
    Object? prevCursor = freezed,
    Object? prevPageUrl = freezed,
    Object? ulids = null,
  }) {
    return _then(_$TrendingVideosImpl(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      nextCursor: null == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String,
      nextPageUrl: null == nextPageUrl
          ? _value.nextPageUrl
          : nextPageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      prevCursor: freezed == prevCursor
          ? _value.prevCursor
          : prevCursor // ignore: cast_nullable_to_non_nullable
              as dynamic,
      prevPageUrl: freezed == prevPageUrl
          ? _value.prevPageUrl
          : prevPageUrl // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ulids: null == ulids
          ? _value._ulids
          : ulids // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$TrendingVideosImpl implements _TrendingVideos {
  const _$TrendingVideosImpl(
      {required this.path,
      required this.perPage,
      required this.nextCursor,
      required this.nextPageUrl,
      required this.prevCursor,
      required this.prevPageUrl,
      required final List<String> ulids})
      : _ulids = ulids;

  @override
  final String path;
  @override
  final int perPage;
  @override
  final String nextCursor;
  @override
  final String nextPageUrl;
  @override
  final dynamic prevCursor;
  @override
  final dynamic prevPageUrl;
  final List<String> _ulids;
  @override
  List<String> get ulids {
    if (_ulids is EqualUnmodifiableListView) return _ulids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ulids);
  }

  @override
  String toString() {
    return 'TrendingVideos(path: $path, perPage: $perPage, nextCursor: $nextCursor, nextPageUrl: $nextPageUrl, prevCursor: $prevCursor, prevPageUrl: $prevPageUrl, ulids: $ulids)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrendingVideosImpl &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor) &&
            (identical(other.nextPageUrl, nextPageUrl) || other.nextPageUrl == nextPageUrl) &&
            const DeepCollectionEquality().equals(other.prevCursor, prevCursor) &&
            const DeepCollectionEquality().equals(other.prevPageUrl, prevPageUrl) &&
            const DeepCollectionEquality().equals(other._ulids, _ulids));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      path,
      perPage,
      nextCursor,
      nextPageUrl,
      const DeepCollectionEquality().hash(prevCursor),
      const DeepCollectionEquality().hash(prevPageUrl),
      const DeepCollectionEquality().hash(_ulids));

  /// Create a copy of TrendingVideos
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrendingVideosImplCopyWith<_$TrendingVideosImpl> get copyWith =>
      __$$TrendingVideosImplCopyWithImpl<_$TrendingVideosImpl>(this, _$identity);
}

abstract class _TrendingVideos implements TrendingVideos {
  const factory _TrendingVideos(
      {required final String path,
      required final int perPage,
      required final String nextCursor,
      required final String nextPageUrl,
      required final dynamic prevCursor,
      required final dynamic prevPageUrl,
      required final List<String> ulids}) = _$TrendingVideosImpl;

  @override
  String get path;
  @override
  int get perPage;
  @override
  String get nextCursor;
  @override
  String get nextPageUrl;
  @override
  dynamic get prevCursor;
  @override
  dynamic get prevPageUrl;
  @override
  List<String> get ulids;

  /// Create a copy of TrendingVideos
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrendingVideosImplCopyWith<_$TrendingVideosImpl> get copyWith => throw _privateConstructorUsedError;
}
