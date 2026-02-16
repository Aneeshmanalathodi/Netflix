import 'package:go_router/go_router.dart';
import 'package:netflix_web/presentation/pages/home_screen.dart';
import 'package:netflix_web/presentation/pages/login.dart';
import 'package:netflix_web/presentation/pages/movie_detail_screen.dart';
import 'package:netflix_web/presentation/pages/search_screen.dart';
import 'package:netflix_web/presentation/pages/splash.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/movie/:id',
      name: 'movieDetail',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return MovieDetailScreen(movieId: id);
      },
    ),
    GoRoute(
      path: '/search',
      name: 'search',
      builder: (context, state) {
        final query = state.uri.queryParameters['query'] ?? '';
        return SearchScreen(query: query);
      },
    ),
  ],
);
