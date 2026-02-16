import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netflix_web/core/services/dio_client.dart';
import 'package:netflix_web/data/model/movie_model.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

final trendingMoviesProvider = FutureProvider<List<Movie>>((ref) async {
  return ref.read(apiServiceProvider).getTrending();
});

final topRatedMoviesProvider = FutureProvider<List<Movie>>((ref) async {
  return ref.read(apiServiceProvider).getTopRated();
});

final upcomingMoviesProvider = FutureProvider<List<Movie>>((ref) async {
  return ref.read(apiServiceProvider).getUpcoming();
});

final searchMoviesProvider = FutureProvider.family<List<Movie>, String>((
  ref,
  query,
) async {
  return ref.read(apiServiceProvider).searchMovies(query);
});

final movieDetailsProvider = FutureProvider.family<Movie, int>((ref, id) async {
  return ref.read(apiServiceProvider).getMovieDetails(id);
});
