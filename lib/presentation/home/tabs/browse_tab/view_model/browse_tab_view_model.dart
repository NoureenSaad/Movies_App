import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/MoviesGenreEntity.dart';
import 'package:movies_app/domain/usecases/movies_genres_usecase.dart';

@injectable
class BrowseTabViewModel extends Cubit<BrowseTabStates>{
  MoviesGenresUseCase moviesGenresUseCase;
  @factoryMethod
  BrowseTabViewModel(this.moviesGenresUseCase):super(BrowseTabInitialState());

  getMoviesGenres() async{
    emit(BrowseTabLoadingState());
    var result = await moviesGenresUseCase.call();
    result.fold((genres) {
      emit(BrowseTabSuccessState(genres));
    }, (error) {
      emit(BrowseTabErrorState(error));
    });
  }
}

abstract class BrowseTabStates{}
class BrowseTabInitialState extends BrowseTabStates{}
class BrowseTabLoadingState extends BrowseTabStates{}
class BrowseTabSuccessState extends BrowseTabStates{
  List<MoviesGenreEntity> genres;
  BrowseTabSuccessState(this.genres);
}
class BrowseTabErrorState extends BrowseTabStates{
  String error;
  BrowseTabErrorState(this.error);
}