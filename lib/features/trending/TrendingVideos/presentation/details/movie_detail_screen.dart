import 'package:flutter/material.dart';
import 'package:play_tv/features/trending/TrendingVideos/domain/model/video.dart';

class MovieDetailScreen extends StatelessWidget {
  final Video movie;

  const MovieDetailScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(movie.videos[0].thumbnail.url),
            SizedBox(height: 16),
            Text(
              movie.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Add more movie details here
          ],
        ),
      ),
    );
  }
}
