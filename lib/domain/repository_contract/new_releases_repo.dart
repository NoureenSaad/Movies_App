import 'package:either_dart/either.dart';
import 'package:movies_app/domain/entities/NewReleasesEntity.dart';

abstract class NewReleasesRepo {
  Future<Either<List<NewReleasesEntity>, String>> getNewReleasesMovies();
}
