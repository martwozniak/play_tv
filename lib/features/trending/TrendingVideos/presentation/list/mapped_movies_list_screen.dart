import 'package:flutter/material.dart';
import 'package:play_tv/features/trending/TrendingVideos/data/repository/trending_videos_repository.dart';
import 'package:play_tv/features/trending/TrendingVideos/domain/model/trending_videos.dart';
import 'package:provider/provider.dart';
import 'package:play_tv/features/trending/TrendingVideos/domain/model/trending_videos.dart';

class MappedMoviesList extends StatefulWidget {
  const MappedMoviesList({super.key});

  @override
  State<MappedMoviesList> createState() => _MappedMoviesListState();
}

class _MappedMoviesListState extends State<MappedMoviesList> {
  late Future<List<TrendingVideos>> _trendingVideosFuture;

  @override
  void initState() async {
    super.initState();
    final repository = Provider.of<TrendingVideosRepository>(context, listen: false);

    final trendingVideos = await repository.getTrendingVideos();
    _trendingVideosFuture = repository.mapToTrendingVideos(
      trendingVideos
    ) as Future<List<TrendingVideos>>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Videos'),
      ),
      body: FutureBuilder<List<TrendingVideos>>(
        future: _trendingVideosFuture,
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
                  title: Text(video.ulids.first),
                  subtitle: Text('Per Page: ${video.perPage}'),
                  // You can customize this to display more details
                );
              },
            );
          }
        },
      ),
    );
  }
}
