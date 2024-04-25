import 'package:either_dart/either.dart';

import '../model/MovieDetailsResponse/MovieDetailsResponse.dart';

abstract class MovieDetailsDataSource {
  Future<Either<MovieDetailsResponse, String>> getMovieDetails(int movieId);
}
