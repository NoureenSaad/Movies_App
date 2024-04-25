import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:movies_app/domain/usecases/new_releases_use_case.dart';

import '../../../../../../domain/entities/MoviesEntity.dart';

@injectable
class NewReleasesMoviesViewModel extends Cubit<NewReleasesMoviesStates> {
  NewReleasesUseCase newReleasesUseCase;

  @factoryMethod
  NewReleasesMoviesViewModel(this.newReleasesUseCase)
      : super(NewReleasesMoviesInitState());

  static NewReleasesMoviesViewModel get(BuildContext context) =>
      BlocProvider.of(context);

  getNewReleaseMovie() async {
    emit(NewReleasesMoviesLoadingState());
    var result = await newReleasesUseCase.callNewReleasesMovies();
    result.fold(
      (newReleaseMovie) => emit(
        NewReleaseMoviesSuccessState(newReleaseMovie),
      ),
      (error) => emit(
        NewReleaseMoviesErrorState(error),
      ),
    );
  }
}

abstract class NewReleasesMoviesStates {}

class NewReleasesMoviesInitState extends NewReleasesMoviesStates {}

class NewReleasesMoviesLoadingState extends NewReleasesMoviesStates {}

class NewReleaseMoviesSuccessState extends NewReleasesMoviesStates {
  List<MoviesEntity> newReleaseMovies;

  NewReleaseMoviesSuccessState(this.newReleaseMovies);
}

class NewReleaseMoviesErrorState extends NewReleasesMoviesStates {
  String error;

  NewReleaseMoviesErrorState(this.error);
}
