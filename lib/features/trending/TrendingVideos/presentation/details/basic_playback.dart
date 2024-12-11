import 'package:bitmovin_player/bitmovin_player.dart';
import 'package:flutter/material.dart';
import 'package:play_tv/features/trending/TrendingVideos/presentation/player/controls.dart';
import 'package:play_tv/env/env.dart';
import 'package:play_tv/features/trending/TrendingVideos/domain/model/video.dart';
import 'package:play_tv/features/trending/TrendingVideos/presentation/player/platform.dart';
import 'package:play_tv/features/trending/TrendingVideos/presentation/player/player_view_container.dart';

class BasicPlayback extends StatefulWidget {
  final Video video;

  const BasicPlayback({super.key, required this.video});
  static String routeName = 'BasicPlayback';

  @override
  State<BasicPlayback> createState() => _BasicPlaybackState();
}

class _BasicPlaybackState extends State<BasicPlayback> {
  late final Video video;

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
    // _player.loadSourceConfig(_sourceConfig);
    _player.loadSourceConfig(SourceConfig(url: video.videos[0].url as String, type: SourceType.progressive));
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
        title: const Text('Basic Playback'),
      ),
      body: ListView(
        children: [
          PlayerViewContainer(player: _player),
          // Container(
          //   margin: const EdgeInsets.only(top: 5),
          //   child: Controls(
          //     onLoadPressed: () => _player.loadSourceConfig(_sourceConfig),
          //     onPlayPressed: _player.play,
          //     onPausePressed: _player.pause,
          //     onMutePressed: _player.mute,
          //     onUnmutePressed: _player.unmute,
          //     onSkipForwardPressed: () async =>
          //         _player.seek(await _player.currentTime + 10),
          //     onSkipBackwardPressed: () async =>
          //         _player.seek(await _player.currentTime - 10),
          //   ),
          // ),
          Container(
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
            video.title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            video.body,
            style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          ),
        ], 
      ),
    );
  }
}
