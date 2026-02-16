import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_web/core/constants/constant.dart';
import 'package:netflix_web/domain/providcers/providers.dart';

class SearchScreen extends ConsumerWidget {
  final String query;
  const SearchScreen({required this.query, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchAsync = ref.watch(searchMoviesProvider(query));

    return Scaffold(
      appBar: AppBar(
        title: Text('Search: "$query"'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: searchAsync.when(
        data: (movies) {
          if (movies.isEmpty) {
            return const Center(child: Text('No movies found'));
          }
          return LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = (constraints.maxWidth / 200).floor();
              crossAxisCount = crossAxisCount.clamp(2, 6);
              return GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.7,
                ),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return GestureDetector(
                    onTap: () => context.push('/movie/${movie.id}'),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: movie.posterPath != null
                            ? '${Constants.tmdbImageBaseUrl}${movie.posterPath}'
                            : 'https://via.placeholder.com/200x300?text=No+Image',
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
                  );
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
