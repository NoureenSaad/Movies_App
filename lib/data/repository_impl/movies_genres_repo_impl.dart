import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/datasource_contract/movies_genres_datasource.dart';

import 'package:movies_app/domain/entities/MoviesGenreEntity.dart';

import '../../domain/repository_contract/movies_genres_repo.dart';

@Injectable(as: MoviesGenresRepo)
class MoviesGenresRepoImpl extends MoviesGenresRepo {
  MoviesGenresDataSource apiMoviesGenresDataSource;

  @factoryMethod
  MoviesGenresRepoImpl(this.apiMoviesGenresDataSource);

  @override
  Future<Either<List<MoviesGenreEntity>, String>> getMoviesGenres() async {
    var result = await apiMoviesGenresDataSource.getMoviesGenres();
    return result.fold((response) {
      var moviesGenresModelList = response.genres ?? [];
      var moviesGenresEntityList = moviesGenresModelList
          .map((genre) => genre.toMoviesGenreEntity())
          .toList();
      return Left(moviesGenresEntityList);
    }, (error) {
      return Right(error);
    });
  }
}
