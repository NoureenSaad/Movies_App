import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import 'package:movies_app/domain/repository_contract/new_releases_repo.dart';

import '../entities/MoviesEntity.dart';

@injectable
class NewReleasesUseCase {
  NewReleasesRepo newReleasesRepo;

  @factoryMethod
  NewReleasesUseCase(this.newReleasesRepo);

  Future<Either<List<MoviesEntity>, String>> callNewReleasesMovies() {
    return newReleasesRepo.getNewReleasesMovies();
  }
}
