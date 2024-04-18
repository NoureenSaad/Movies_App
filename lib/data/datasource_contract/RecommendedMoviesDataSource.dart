import 'package:either_dart/either.dart';
import 'package:movies_app/data/model/recommended_movies_response/RecommendedMoviesResponse.dart';

abstract class RecommendedMoviesDataSource {
  Future<Either<RecommendedMoviesResponse, String>> getRecommendedMovies();
}
