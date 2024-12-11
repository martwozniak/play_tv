import 'package:bitmovin_player/bitmovin_player.dart';
import 'package:flutter/material.dart';

class BasicPlayback extends StatefulWidget {
  const BasicPlayback({super.key});

  @override
  State<BasicPlayback> createState() => _BasicPlaybackState();
}

class _BasicPlaybackState extends State<BasicPlayback> {
  final _sourceConfig = const SourceConfig(
    url: 'https://bitmovin-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8',
    type: SourceType.hls,
  );
  final _player = Player(
    config: const PlayerConfig(
      key: '',
    ),
  );

  @override
  void initState() {
    _player.loadSourceConfig(_sourceConfig);
    super.initState();
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
      body: Column(
        children: [
          SizedBox.fromSize(
            size: const Size.fromHeight(250),
            child: PlayerView(
              player: _player,
            ),
          ),
        ],
      ),
    );
  }
}
