import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/MoviesEntity.dart';
import '../../../../domain/usecases/search_usecase.dart';

@injectable
class SearchViewModel extends Cubit<SearchState> {
  SearchUseCase searchUseCase;

  @factoryMethod
  SearchViewModel(this.searchUseCase) : super(SearchInitState());

  static SearchViewModel get(context) => BlocProvider.of(context);

  search(String query) async {
    emit(SearchLoadingState());
    var result = await searchUseCase.search(query);
    result.fold((moviesList) {
      emit(SearchSuccessState(moviesList));
    }, (error) {
      emit(SearchErrorState(error));
    });
  }

}

abstract class SearchState {}

class SearchInitState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchErrorState extends SearchState {
  String? errorMessage;

  SearchErrorState(this.errorMessage);
}

class SearchSuccessState extends SearchState {
  List<MoviesEntity>? moviesList;

  SearchSuccessState(this.moviesList);
}