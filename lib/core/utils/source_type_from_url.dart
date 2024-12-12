import 'package:bitmovin_player/bitmovin_player.dart';

SourceType getSourceTypeFromUrl(String url) {
  final extension = url.toLowerCase().split('.').last;

  switch (extension) {
    case 'mp4':
      return SourceType.progressive;
    case 'm3u8':
      return SourceType.hls;
    case 'mpd':
      return SourceType.dash;
    default:
      return SourceType.progressive;
  }
}
