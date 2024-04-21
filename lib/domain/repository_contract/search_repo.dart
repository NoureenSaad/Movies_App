import 'package:either_dart/either.dart';

import '../entities/MoviesEntity.dart';

abstract class SearchRepo{
  Future<Either<List<MoviesEntity>,String>> search(String query);
}