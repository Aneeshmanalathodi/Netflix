class Movie {
  final int id;
  final String title;
  final String? posterPath;
  final String? backdropPath;
  final String? overview;
  final String releaseDate;
  final double voteAverage;

  Movie({
    required this.id,
    required this.title,
    this.posterPath,
    this.backdropPath,
    this.overview,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'] ?? json['name'] ?? '',
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      overview: json['overview'],
      releaseDate: json['release_date'] ?? '',
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
    );
  }
}
