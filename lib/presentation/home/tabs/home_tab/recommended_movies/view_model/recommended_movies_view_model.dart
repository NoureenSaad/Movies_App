import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/usecases/recommended_movies_use_case.dart';

import '../../../../../../domain/entities/MoviesEntity.dart';

@injectable
class RecommendedMoviesViewModel extends Cubit<RecommendedMoviesStates> {
  RecommendedMoviesUseCase recommendedMoviesUseCase;

  @factoryMethod
  RecommendedMoviesViewModel(this.recommendedMoviesUseCase)
      : super(RecommendedMoviesInitState());

  static RecommendedMoviesViewModel get(BuildContext context) =>
      BlocProvider.of(context);

  getRecommendedMovie() async {
    emit(RecommendedMoviesLoadingState());
    var result = await recommendedMoviesUseCase.callRecommendedMovies();
    result.fold(
      (recommendedMovie) => emit(
        RecommendedMoviesSuccessState(recommendedMovie),
      ),
      (error) => emit(
        RecommendedMoviesErrorState(error),
      ),
    );
  }
}

abstract class RecommendedMoviesStates {}

class RecommendedMoviesInitState extends RecommendedMoviesStates {}

class RecommendedMoviesLoadingState extends RecommendedMoviesStates {}

class RecommendedMoviesSuccessState extends RecommendedMoviesStates {
  List<MoviesEntity> recommendedMovies;

  RecommendedMoviesSuccessState(this.recommendedMovies);
}

class RecommendedMoviesErrorState extends RecommendedMoviesStates {
  String error;

  RecommendedMoviesErrorState(this.error);
}
