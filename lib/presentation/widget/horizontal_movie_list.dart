import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_web/core/constants/constant.dart';
import 'package:netflix_web/data/model/movie_model.dart';

class HorizontalMovieList extends ConsumerWidget {
  final String title;
  final AsyncValue<List<Movie>> moviesAsync;
  const HorizontalMovieList({
    required this.title,
    required this.moviesAsync,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 200,
          child: moviesAsync.when(
            data: (movies) {
              if (movies.isEmpty) {
                return const Center(child: Text('No movies found'));
              }
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return GestureDetector(
                    onTap: () => context.push('/movie/${movie.id}'),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl: movie.posterPath != null
                              ? '${Constants.tmdbImageBaseUrl}${movie.posterPath}'
                              : 'https://via.placeholder.com/150x225?text=No+Image',
                          width: 130,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: Colors.grey[900],
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            color: Colors.grey[900],
                            child: const Icon(
                              Icons.broken_image,
                              color: Colors.white54,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(child: Text('Error: $error')),
          ),
        ),
      ],
    );
  }
}
