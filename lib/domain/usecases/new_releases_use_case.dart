import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/NewReleasesEntity.dart';
import 'package:movies_app/domain/repository_contract/new_releases_repo.dart';

@injectable
class NewReleasesUseCase {
  NewReleasesRepo newReleasesRepo;

  @factoryMethod
  NewReleasesUseCase(this.newReleasesRepo);

  Future<Either<List<NewReleasesEntity>, String>> callNewReleasesMovies() {
    return newReleasesRepo.getNewReleasesMovies();
  }
}
