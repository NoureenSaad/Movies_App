import 'package:either_dart/either.dart';
import 'package:movies_app/data/model/popular_movies_response/Popular_movies_response.dart';

abstract class PopularMoviesDatasource {
  Future<Either<PopularMoviesResponse, String>> getPopularMovies();
}
