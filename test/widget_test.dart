import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:netflix_web/data/model/movie_model.dart';
import 'package:netflix_web/presentation/widget/horizontal_movie_list.dart';

void main() {
  testWidgets('HorizontalMovieList shows loading indicator when loading', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: HorizontalMovieList(
              title: 'Trending',
              moviesAsync: AsyncValue.loading(),
            ),
          ),
        ),
      ),
    );
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('HorizontalMovieList shows movies when data loaded', (WidgetTester tester) async {
    final movies = [
      Movie(id: 1, title: 'Test Movie', posterPath: null, backdropPath: null, overview: '', releaseDate: '', voteAverage: 0),
    ];
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: HorizontalMovieList(
              title: 'Trending',
              moviesAsync: AsyncValue.data(movies),
            ),
          ),
        ),
      ),
    );
    expect(find.text('Trending'), findsOneWidget);
    expect(find.byType(GestureDetector), findsOneWidget);
  });
}