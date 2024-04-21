import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/MoviesDetailsEntity.dart';
import '../../../../../domain/usecases/movies_details_usecase.dart';

@injectable
class MovieDetailsViewModel extends Cubit<MovieDetailsState> {
  final MovieDetailsUseCase movieDetailsUseCase;

  MovieDetailsViewModel(this.movieDetailsUseCase) : super(MovieDetailsInitial());

  void fetchMovieDetails(int movieId) async {
    emit(MovieDetailsLoading());
    final result = await movieDetailsUseCase.getMovieDetails(movieId);
    result.fold(

          (details) => emit(MovieDetailsLoaded(details)),
          (error) => emit(MovieDetailsError(error.toString())),
    );
  }
}


abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsLoaded extends MovieDetailsState {
  final MoviesDetailsEntity details;

  MovieDetailsLoaded(this.details);
}

class MovieDetailsError extends MovieDetailsState {
  final String message;

  MovieDetailsError(this.message);
}
