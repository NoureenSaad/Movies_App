import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/MoviesEntity.dart';
import '../../domain/repository_contract/similar_movies_repo.dart';
import '../datasource_contract/similar_dataSource_contract.dart';
@Injectable(as:SimilarRepo )
class SimilarRepoImpl extends SimilarRepo{
  SimilarDatasourceContract similarDatasourceContract ;
  @factoryMethod
  SimilarRepoImpl(this.similarDatasourceContract);
  @override
  Future<Either<List<MoviesEntity>, String>> getSimilarMovies(int movieId) async {
    var result = await similarDatasourceContract.getSimilarMovies(movieId);
    return result.fold(
            (response){
          var responseList = response.results??[];
          var similarList = responseList.map((similarMovie) => MoviesEntity(
            title: similarMovie.title,
            overview: similarMovie.overview,
            adult: similarMovie.adult,
            releaseDate: similarMovie.releaseDate,
            posterPath: similarMovie.posterPath,
            backdropPath: similarMovie.backdropPath,
            id: similarMovie.id,
            voteAverage: similarMovie.voteAverage,
          )).toList();
          return Left(similarList);

        },
            (error) => Right(error)
    );
  }

}