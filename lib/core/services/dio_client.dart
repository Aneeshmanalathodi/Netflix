import 'package:dio/dio.dart';
import 'package:netflix_web/core/constants/constant.dart';
import 'package:netflix_web/data/model/movie_model.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Constants.tmdbBaseUrl,
      queryParameters: {'api_key': Constants.tmdbApiKey},
    ),
  );

  Future<List<Movie>> getTrending() async {
    final response = await _dio.get('/trending/movie/day');
    return _parseMovies(response.data);
  }

  Future<List<Movie>> getTopRated() async {
    final response = await _dio.get('/movie/top_rated');
    return _parseMovies(response.data);
  }

  Future<List<Movie>> getUpcoming() async {
    final response = await _dio.get('/movie/upcoming');
    return _parseMovies(response.data);
  }

  Future<List<Movie>> searchMovies(String query) async {
    final response = await _dio.get(
      '/search/movie',
      queryParameters: {'query': query},
    );
    return _parseMovies(response.data);
  }

  Future<Movie> getMovieDetails(int id) async {
    final response = await _dio.get('/movie/$id');
    return Movie.fromJson(response.data);
  }

  List<Movie> _parseMovies(Map<String, dynamic> data) {
    final results = data['results'] as List;
    return results.map((e) => Movie.fromJson(e)).toList();
  }
}
