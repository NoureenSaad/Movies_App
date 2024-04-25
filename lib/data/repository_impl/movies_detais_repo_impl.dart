import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/datasource_contract/movies_details_datasource.dart';
import 'package:movies_app/domain/entities/MoviesDetailsEntity.dart';
import 'package:movies_app/domain/repository_contract/movies_details_repo.dart';

@Injectable(as: MovieDetailsRepo)
class MoviesDetailsRepoImpl extends MovieDetailsRepo {
  final MovieDetailsDataSource _moviesDetailsDataSource;

  MoviesDetailsRepoImpl(this._moviesDetailsDataSource);

  @override
  Future<Either<MoviesDetailsEntity, String>> getMovieDetails(
      int movieId) async {
    var result = await _moviesDetailsDataSource.getMovieDetails(movieId);
    return result.fold(
            (response) {
          var movieDetails = MoviesDetailsEntity(
            adult: response.adult,
            backdropPath: response.backdropPath,
            id: response.id,
            title: response.title,
            posterPath: response.posterPath,
            releaseDate: response.releaseDate,
            overview: response.overview,
            voteAverage: response.voteAverage,
            runtime: response.runtime,
            genres: response.genres,
          );
          return Left(movieDetails) ;
        },
            (error) => Right(error)
    );
}}


