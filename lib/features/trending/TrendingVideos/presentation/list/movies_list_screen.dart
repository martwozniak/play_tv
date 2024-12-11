import 'package:flutter/material.dart';
import 'package:play_tv/features/trending/TrendingVideos/data/network/entity/trending_videos_entity.dart';
import 'package:play_tv/features/trending/TrendingVideos/data/repository/trending_videos_repository.dart';
import 'package:play_tv/features/trending/TrendingVideos/domain/model/trending_videos.dart';
import 'package:play_tv/features/trending/TrendingVideos/domain/model/video.dart' as video;
import 'package:play_tv/features/trending/TrendingVideos/presentation/details/basic_playback.dart';
import 'package:play_tv/features/trending/TrendingVideos/presentation/details/movie_detail_screen.dart';
import 'package:provider/provider.dart';

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
                return ListTile(
                  title: Text('Title: ${video.title}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Per Page: ${video.videos.length}'),
                      SizedBox(height: 8),
                      Image.network(video.videos[0].thumbnail.url as String),
                      Text(' ${video.title}'),
                      // Image.network(video.user.avatar),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BasicPlayback(video: video),
                      ),
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
