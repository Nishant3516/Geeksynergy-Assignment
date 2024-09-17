import 'package:dio/dio.dart';

class MovieRepository {
  final Dio dio;

  MovieRepository(this.dio);

  Future<List<dynamic>> getMovies() async {
    final response = await dio.post(
      'https://hoblist.com/api/movieList',
      data: {
        "category": "movies",
        "language": "kannada",
        "genre": "all",
        "sort": "voting",
      },
    );
    if (response.statusCode == 200) {
      return response.data['result'];
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
