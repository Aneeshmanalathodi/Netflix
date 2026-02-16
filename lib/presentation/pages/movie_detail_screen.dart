import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_web/core/constants/constant.dart';
import 'package:netflix_web/domain/providcers/providers.dart';

class MovieDetailScreen extends ConsumerWidget {
  final int movieId;
  const MovieDetailScreen({required this.movieId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieAsync = ref.watch(movieDetailsProvider(movieId));

    return Scaffold(
      body: movieAsync.when(
        data: (movie) => Stack(
          children: [
            // Backdrop image
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: movie.backdropPath != null
                    ? '${Constants.tmdbBackdropBaseUrl}${movie.backdropPath}'
                    : 'https://via.placeholder.com/1280x720?text=No+Backdrop',
                fit: BoxFit.cover,
                errorWidget: (context, url, error) =>
                    Container(color: Colors.black),
              ),
            ),
            // Gradient overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.9)],
                ),
              ),
            ),
            // Content
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => context.pop(),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            movie.title,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                movie.releaseDate.isNotEmpty
                                    ? movie.releaseDate
                                    : 'Release date unknown',
                              ),
                              const SizedBox(width: 16),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(movie.voteAverage.toStringAsFixed(1)),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            movie.overview ?? 'No overview available.',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        loading: () =>
            const Scaffold(body: Center(child: CircularProgressIndicator())),
        error: (error, stack) => Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Error loading movie: $error'),
                ElevatedButton(
                  onPressed: () => ref.refresh(movieDetailsProvider(movieId)),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
