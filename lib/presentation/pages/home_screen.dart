import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_web/domain/providcers/providers.dart';
import 'package:netflix_web/presentation/widget/horizontal_movie_list.dart';
import 'package:netflix_web/presentation/widget/left_navigation_rail.dart';
import 'package:netflix_web/presentation/widget/top_bar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool extendedRail = screenWidth > 800;

    return Scaffold(
      body: Row(
        children: [
          LeftNavigationRail(extended: extendedRail),
          Expanded(
            child: Column(
              children: [
                TopBar(
                  onSearchSubmitted: (query) {
                    if (query.isNotEmpty) {
                      context.go('/search?query=$query');
                    }
                  },
                ),
                Expanded(
                  child: ListView(
                    children: [
                      HorizontalMovieList(
                        title: 'Trending Now',
                        moviesAsync: ref.watch(trendingMoviesProvider),
                      ),
                      HorizontalMovieList(
                        title: 'Top Rated',
                        moviesAsync: ref.watch(topRatedMoviesProvider),
                      ),
                      HorizontalMovieList(
                        title: 'Upcoming',
                        moviesAsync: ref.watch(upcomingMoviesProvider),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Text(
                          'Continue Watching',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Container(
                                width: 130,
                                color: Colors.grey[900],
                                child: const Center(child: Text('Placeholder')),
                              ),
                            );
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Text(
                          'Blockbuster Action',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Container(
                                width: 130,
                                color: Colors.grey[900],
                                child: const Center(child: Text('Placeholder')),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
