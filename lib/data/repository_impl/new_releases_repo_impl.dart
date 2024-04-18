import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/datasource_contract/new_releases_datasource.dart';



import '../../domain/entities/MoviesEntity.dart';
import '../../domain/repository_contract/new_releases_repo.dart';

@Injectable(as: NewReleasesRepo)
class NewReleasesRepoImpl extends NewReleasesRepo {
  NewReleasesDataSource apiDataSource;

  @factoryMethod
  NewReleasesRepoImpl(this.apiDataSource);

  @override
  Future<Either<List<MoviesEntity>, String>> getNewReleasesMovies() async {
    var result = await apiDataSource.getNewReleases();
    return result.fold(
      (response) {
        var newReleaseListModel = response.results ?? [];
        var newReleaseEntityList = newReleaseListModel
            .map((newReleaseMovie) => newReleaseMovie.toNewReleasesEntity())
            .toList();
        return Left(newReleaseEntityList);
      },
      (error) => Right(error),
    );
  }
}
