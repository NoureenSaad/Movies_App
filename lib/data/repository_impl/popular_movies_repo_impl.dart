import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/datasource_contract/popular_movies_datasource.dart';

import '../../domain/entities/MoviesEntity.dart';
import '../../domain/repository_contract/popular_movies_repo.dart';

@Injectable(as: PopularMoviesRepo)
class PopularMoviesRepoImpl extends PopularMoviesRepo {
  PopularMoviesDatasource apiDatasource;

  @factoryMethod
  PopularMoviesRepoImpl(this.apiDatasource);

  @override
  Future<Either<List<MoviesEntity>, String>> getPopularMovies() async {
    var result = await apiDatasource.getPopularMovies();
    return result.fold(
      (response) {
        var popularMoviesListModel = response.results ?? [];
        var popularMoviesEntityList = popularMoviesListModel
            .map((popularMovie) => popularMovie.toPopularMoviesEntity())
            .toList();
        return Left(popularMoviesEntityList);
      },
      (error) => Right(error),
    );
  }
}
