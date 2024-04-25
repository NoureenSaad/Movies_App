import 'package:either_dart/either.dart';

import '../model/SimilarMoviesResponse/similarResponse.dart';

abstract class SimilarDatasourceContract{
  Future<Either<SimilarResponse,String>> getSimilarMovies(int movieId);
}