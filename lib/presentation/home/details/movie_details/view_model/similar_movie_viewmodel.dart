import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/MoviesEntity.dart';
import 'package:movies_app/domain/usecases/similar_movies_usecase.dart';

@injectable
class SimilarMoviesViewModel extends Cubit<SimilarMoviesState> {
  final SimilarMovieUseCase similarMoviesUseCase;

  SimilarMoviesViewModel(this.similarMoviesUseCase) : super(SimilarMoviesInitial());

  void fetchSimilarMovies(int movieId) async {
    emit(SimilarMoviesLoading());
    final result = await similarMoviesUseCase.getSimilarMovies(movieId);
    result.fold(
          (movies) => emit(SimilarMoviesSucess(movies)),
          (error) => emit(SimilarMoviesError(error.toString())),
    );
  }
}

abstract class SimilarMoviesState {}

class SimilarMoviesInitial extends SimilarMoviesState {}

class SimilarMoviesLoading extends SimilarMoviesState {}

class SimilarMoviesSucess extends SimilarMoviesState {
  final List<MoviesEntity> similarMovies;

  SimilarMoviesSucess(this.similarMovies);
}

class SimilarMoviesError extends SimilarMoviesState {
  final String message;

  SimilarMoviesError(this.message);
}
