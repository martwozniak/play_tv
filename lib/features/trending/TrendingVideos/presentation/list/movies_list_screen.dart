import 'package:flutter/material.dart';
import 'package:play_tv/features/trending/TrendingVideos/data/network/entity/trending_videos_entity.dart';
import 'package:play_tv/features/trending/TrendingVideos/data/repository/trending_videos_repository.dart';
import 'package:play_tv/features/trending/TrendingVideos/domain/model/video.dart'
    as video;
import 'package:play_tv/features/trending/TrendingVideos/presentation/details/basic_playback.dart';
import 'package:provider/provider.dart';
import 'package:play_tv/features/trending/TrendingVideos/domain/model/user.dart'
    as user;
import 'package:play_tv/core/utils/date_time_formatter.dart';

class MoviesList extends StatefulWidget {
  const MoviesList({super.key});

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  final List<video.Video> _videos = [];
  String? _nextCursor;
  bool _isLoading = false;
  bool _hasMoreVideos = true;
  String? _error;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadInitialVideos();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (!_scrollController.hasClients) return;

    final position = _scrollController.position.pixels;
    final maxExtent = _scrollController.position.maxScrollExtent;

    print('Scroll - Position: $position, MaxExtent: $maxExtent');
    print('Scroll - IsLoading: $_isLoading, HasMore: $_hasMoreVideos');

    if (position >= maxExtent * 0.8 && !_isLoading && _hasMoreVideos) {
      print('Scroll - Loading more videos...');
      _loadMoreVideos();
    }
  }

  Future<void> _loadInitialVideos() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      print('Loading initial videos...');
      final repository =
          Provider.of<TrendingVideosRepository>(context, listen: false);
      final videos = await repository.getTrendingVideosWithCursor();
      final entity = await repository.getTrendingVideosEntity();

      print('Initial load - Videos count: ${videos.length}');
      print('Initial load - Next cursor: ${entity.nextCursor}');

      if (mounted) {
        setState(() {
          _videos.clear();
          _videos.addAll(videos);
          _nextCursor = entity.nextCursor;
          // _hasMoreVideos = videos.isNotEmpty;
          _error = null;
        });
      }
    } catch (e) {
      print('Error loading initial videos: $e');
      if (mounted) {
        setState(() {
          _error = 'Failed to load videos. Please try again.';
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _loadMoreVideos() async {
    if (_isLoading || !_hasMoreVideos || _nextCursor == null) {
      print(
          'Skip loading more - IsLoading: $_isLoading, HasMore: $_hasMoreVideos, Cursor: $_nextCursor');
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      print('Loading more videos with cursor: $_nextCursor');
      final repository =
          Provider.of<TrendingVideosRepository>(context, listen: false);
      final videos = await repository.getTrendingVideosWithCursor(_nextCursor);
      final entity = await repository.getTrendingVideosEntity(_nextCursor);

      print('Load more - Videos count: ${videos.length}');
      print('Load more - Next cursor: ${entity.nextCursor}');

      if (mounted) {
        setState(() {
          _videos.addAll(videos);
          _nextCursor = entity.nextCursor;
          // _hasMoreVideos = videos.isNotEmpty;
          _error = null;
        });
      }
    } catch (e) {
      print('Error loading more videos: $e');
      if (mounted) {
        setState(() {
          _error = 'Failed to load more videos. Please try again.';
          // _hasMoreVideos = false;
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Videos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadInitialVideos,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            _videos.clear();
            _nextCursor = null;
            _hasMoreVideos = true;
            _error = null;
          });
          await _loadInitialVideos();
        },
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (_error != null && _videos.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_error!, style: TextStyle(color: Colors.red)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadInitialVideos,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_videos.isEmpty && _isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_videos.isEmpty) {
      return const Center(child: Text('No trending videos found.'));
    }

    return ListView.builder(
      controller: _scrollController,
      itemCount: _videos.length + (_hasMoreVideos || _isLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == _videos.length) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: _error != null
                ? Column(
                    children: [
                      Text(_error!, style: TextStyle(color: Colors.red)),
                      ElevatedButton(
                        onPressed: _loadMoreVideos,
                        child: const Text('Retry'),
                      ),
                    ],
                  )
                : const CircularProgressIndicator(),
          );
        }

        final video = _videos[index];
        return _buildVideoItem(video, index);
      },
    );
  }

  Widget _buildVideoItem(video.Video video, int index) {
    return FutureBuilder<user.User>(
      future: Provider.of<TrendingVideosRepository>(context, listen: false)
          .getUser(video.user.userId as String),
      builder: (context, userSnapshot) {
        final userData = userSnapshot.hasData ? userSnapshot.data : null;
        final avatarUrl = userData?.avatar ?? video.user.avatar as String;
        final username = userData?.name ?? video.username;

        return ListTile(
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              _buildThumbnail(video),
              _buildVideoInfo(video, avatarUrl, username, index),
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    BasicPlayback(video: video, user: userData),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildThumbnail(video.Video video) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.network(
            video.videos[0].thumbnail.url as String,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 8,
          bottom: 8,
          child: Container(
            color: Colors.black54,
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Text(
              _formatDuration(video.videos[0].duration),
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVideoInfo(
      video.Video video, String avatarUrl, String username, int index) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(avatarUrl),
                radius: 20,
                onBackgroundImageError: (exception, stackTrace) {
                  print('Error loading avatar: $exception');
                },
              ),
              const SizedBox(height: 4),
            ],
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "index: ${index} ${video.title}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  username.toString(),
                  style: const TextStyle(fontSize: 12),
                ),
                Row(
                  children: [
                    Text(
                      DateTimeFormatter.getRelativeTime(video.createdAt),
                      style: const TextStyle(fontSize: 12),
                    ),
                    const Text(' • '),
                    Text(
                      '${video.postEngagement.views} views',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  String _formatDuration(int duration) {
    final minutes = duration ~/ 60;
    final seconds = duration % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
