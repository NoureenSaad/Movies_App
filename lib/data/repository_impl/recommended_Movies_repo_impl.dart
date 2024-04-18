import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/MoviesEntity.dart';
import '../../domain/repository_contract/recommended_movies_repo.dart';
import '../datasource_contract/RecommendedMoviesDataSource.dart';

@Injectable(as: RecommendedMoviesRepo)
class RecommendedMoviesRepoImpl extends RecommendedMoviesRepo {
  RecommendedMoviesDataSource apiRecommendedMoviesDataSource;

  @factoryMethod
  RecommendedMoviesRepoImpl(this.apiRecommendedMoviesDataSource);

  @override
  Future<Either<List<MoviesEntity>, String>> getRecommendedMovies() async {
    var result = await apiRecommendedMoviesDataSource.getRecommendedMovies();
    return result.fold((response) {
      var getRecommendedMoviesModelList = response.results ?? [];
      var getRecommendedMoviesEntityList = getRecommendedMoviesModelList
          .map((getRecommendedMovie) =>
              getRecommendedMovie.toRecommendedMoviesEntity())
          .toList();
      return Left(getRecommendedMoviesEntityList);
    }, (error) {
      return Right(error);
    });
  }
}
