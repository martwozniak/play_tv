import 'package:bitmovin_player/bitmovin_player.dart';
import 'package:flutter/material.dart';
import 'package:play_tv/core/utils/date_time_formatter.dart';
import 'package:play_tv/core/utils/source_type_from_url.dart';
import 'package:play_tv/env/env.dart';
import 'package:play_tv/features/trending/TrendingVideos/domain/model/video.dart';
import 'package:play_tv/features/trending/TrendingVideos/domain/model/user.dart' as u;
import 'package:play_tv/features/trending/TrendingVideos/presentation/player/platform.dart';
import 'package:play_tv/features/trending/TrendingVideos/presentation/player/player_view_container.dart';

class BasicPlayback extends StatefulWidget {
  final Video video;
  final u.User? user;

  const BasicPlayback({super.key, required this.video, required this.user});
  static String routeName = 'BasicPlayback';

  @override
  State<BasicPlayback> createState() => _BasicPlaybackState();
}

class _BasicPlaybackState extends State<BasicPlayback> {
  late final Video video;
  late final u.User? user;
  final _sourceConfig = SourceConfig(
    url: isIOS
        ? 'https://bitmovin-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8'
        : 'https://bitmovin-a.akamaihd.net/content/MI201109210084_1/mpds/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.mpd',
    type: isIOS ? SourceType.hls : SourceType.dash,
  );

  final _player = Player(
    config: const PlayerConfig(
      key: Env.bitmovinPlayerLicenseKey,
      playbackConfig: PlaybackConfig(
        isAutoplayEnabled: true,
      ),
      remoteControlConfig: RemoteControlConfig(isCastEnabled: false),
    ),
  );

  @override
  void initState() {
    super.initState();
    video = widget.video;
    user = widget.user;
    // _player.loadSourceConfig(_sourceConfig);
    _player.loadSourceConfig(
        SourceConfig(url: video.videos[0].url as String, type: getSourceTypeFromUrl(video.videos[0].url as String)));
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video'),
      ),
      body: ListView(
        children: [
          PlayerViewContainer(player: _player),
          Container(
            margin: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  video.title,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                if (user != null)
                  Row(
                    children: [
                      // image from internet
                      CircleAvatar(
                        backgroundImage: NetworkImage(user!.avatar),
                        radius: 20,
                        // Add error handling for avatar image
                        onBackgroundImageError: (exception, stackTrace) {
                          print('Error loading avatar: $exception');
                        },
                      ),

                      Container(
                        margin: EdgeInsets.all(8),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user!.name,
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              user!.username,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                Container(
                  margin: EdgeInsets.only(bottom: 4, top: 4),
                  child: Row(
                    children: [
                      Text(DateTimeFormatter.getRelativeTime(video.createdAt), style: TextStyle(fontSize: 12)),
                      Text(' • '),
                      Text('${video.postEngagement.views} Views', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                Text(
                  video.body,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
