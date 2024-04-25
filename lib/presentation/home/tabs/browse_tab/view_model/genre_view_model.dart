import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/usecases/specific_genre_usecase.dart';
import '../../../../../domain/entities/MoviesEntity.dart';

@injectable
class GenreViewModel extends Cubit<GenreSelectedStates>{
  SpecificGenreUseCase genreUseCase;
  @factoryMethod
  GenreViewModel(this.genreUseCase):super(GenreSelectedInitialState());

  getSpecificGenre(String genreID){
    emit(GenreSelectedLoadingState());
    var result = genreUseCase.call(genreID);
    result.fold((response){
      emit(GenreSelectedSuccessState(response));
    },(error){
      emit(GenreSelectedErrorState(error));
    });
  }
}

abstract class GenreSelectedStates{}
class GenreSelectedInitialState extends GenreSelectedStates{}
class GenreSelectedLoadingState extends GenreSelectedStates{}
class GenreSelectedErrorState extends GenreSelectedStates{
  String error;
  GenreSelectedErrorState(this.error);
}
class GenreSelectedSuccessState extends GenreSelectedStates{
  List<MoviesEntity> specificGenre;
  GenreSelectedSuccessState(this.specificGenre);
}