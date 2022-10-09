import 'package:flixr_mv/src/models/movie_item_model.dart';
import 'package:flixr_mv/src/models/resources/movie_api.dart';

class MovieRepository {
  final MovieApiProvider movieApiProvider = MovieApiProvider();
  Future<MovieResponseData?> getMovies({int? pages}) =>
      movieApiProvider.fetchMovieList();
}
