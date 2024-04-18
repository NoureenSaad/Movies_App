
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/usecases/popular_movies_usecase.dart';

import '../../../../../../domain/entities/MoviesEntity.dart';


@injectable
class PopularMoviesViewModel extends Cubit<PopularMoviesStates> {
  PopularMoviesUseCase popularMoviesUseCase;

  @factoryMethod
  PopularMoviesViewModel(this.popularMoviesUseCase)
      : super(PopularMoviesInitState());

  static PopularMoviesViewModel get(BuildContext context) =>
      BlocProvider.of(context);

  getPopularMovie() async {
    emit(PopularMoviesLoadingState());
    var result = await popularMoviesUseCase.callPopularMovie();
    result.fold(
      (popularMovie) => emit(
        PopularMoviesSuccessState(popularMovie),
      ),
      (error) => emit(
        PopularMoviesErrorState(error),
      ),
    );
  }
}

abstract class PopularMoviesStates {}

class PopularMoviesInitState extends PopularMoviesStates {}

class PopularMoviesLoadingState extends PopularMoviesStates {}

class PopularMoviesSuccessState extends PopularMoviesStates {
  List<MoviesEntity> popularMovies;

  PopularMoviesSuccessState(this.popularMovies);
}

class PopularMoviesErrorState extends PopularMoviesStates {
  String error;

  PopularMoviesErrorState(this.error);
}


//todo: widgets of popular movies and show it in home tab