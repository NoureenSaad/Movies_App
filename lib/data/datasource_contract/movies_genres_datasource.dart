import 'package:either_dart/either.dart';

import '../model/MoviesGenresResponse/MoviesGenresResponse.dart';

abstract class MoviesGenresDataSource{
  Future<Either<MoviesGenresResponse, String>> getMoviesGenres();
}