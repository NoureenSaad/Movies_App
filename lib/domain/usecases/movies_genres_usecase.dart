import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/repository_contract/movies_genres_repo.dart';

import '../entities/MoviesGenreEntity.dart';

@injectable
class MoviesGenresUseCase{
  MoviesGenresRepo moviesGenresRepo;
  @factoryMethod
  MoviesGenresUseCase(this.moviesGenresRepo);

  Future<Either<List<MoviesGenreEntity>,String>> call(){
    return moviesGenresRepo.getMoviesGenres();
  }
}