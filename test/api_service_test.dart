import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:netflix_web/core/services/dio_client.dart';
import 'package:netflix_web/data/model/movie_model.dart';
class MockApiService extends Mock implements ApiService {}

void main() {
  group('ApiService', () {
    test('getTrending returns list of movies', () async {
      final service = MockApiService();
      when(service.getTrending()).thenAnswer((_) async => <Movie>[]);
      expect(await service.getTrending(), isA<List<Movie>>());
    });
  });
}