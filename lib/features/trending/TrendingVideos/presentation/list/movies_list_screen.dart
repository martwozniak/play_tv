import 'package:flutter/material.dart';
import 'package:play_tv/features/trending/TrendingVideos/data/network/entity/trending_videos_entity.dart';
import 'package:play_tv/features/trending/TrendingVideos/data/repository/trending_videos_repository.dart';
import 'package:play_tv/features/trending/TrendingVideos/domain/model/video.dart' as video;
import 'package:play_tv/features/trending/TrendingVideos/presentation/details/basic_playback.dart';
import 'package:provider/provider.dart';
import 'package:play_tv/features/trending/TrendingVideos/domain/model/user.dart' as user;
import 'package:play_tv/core/utils/date_time_formatter.dart';

class MoviesList extends StatefulWidget {
  const MoviesList({super.key});

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  late Future<TrendingVideosEntity> _trendingVideosFuture;
  late Future<List<video.Video>> _mapToTrendingVideosFuture;

  @override
  void initState() {
    super.initState();
    final repository = Provider.of<TrendingVideosRepository>(context, listen: false);
    _trendingVideosFuture = repository.getTrendingVideosEntity().then((value) {
      return value;
    });
    _mapToTrendingVideosFuture = repository.mapToTrendingVideosFuture(_trendingVideosFuture);
  }

  // Helper method to format duration
  String _formatDuration(int duration) {
    final minutes = duration ~/ 60;
    final seconds = duration % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Videos'),
      ),
      body: FutureBuilder<List<video.Video>>(
        future: _mapToTrendingVideosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show loading indicator while fetching data
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Show error message if something went wrong
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Show message if no data is available
            return const Center(child: Text('No trending videos found.'));
          } else {
            // Display the list of trending videos
            final trendingVideos = snapshot.data!;
            return ListView.builder(
              itemCount: trendingVideos.length,
              itemBuilder: (context, index) {
                final video = trendingVideos[index];
                return FutureBuilder<user.User>(
                  future: Provider.of<TrendingVideosRepository>(context, listen: false)
                      .getUser(video.user.userId as String),
                  builder: (context, userSnapshot) {
                    final userData = userSnapshot.hasData ? userSnapshot.data : null;
                    final avatarUrl = userData?.avatar ?? video.user.avatar as String;
                    final username = userData?.name ?? video.username;

                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Stack(
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
                                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                  child: Text(
                                    '${_formatDuration(video.videos[0].duration)}',
                                    style: TextStyle(color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(avatarUrl),
                                      radius: 20,
                                      // Add error handling for avatar image
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
                                        video.title,
                                        style: const TextStyle(fontWeight: FontWeight.bold),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        username.toString(),
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Row(
                                        children: [
                                          Text(DateTimeFormatter.getRelativeTime(video.createdAt),
                                              style: TextStyle(fontSize: 12)),
                                          Text(' • '),
                                          Text('${video.postEngagement.views} views', style: TextStyle(fontSize: 12)),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BasicPlayback(video: video, user: userData),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
