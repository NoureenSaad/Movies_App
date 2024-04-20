import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/MoviesEntity.dart';
import '../../../../domain/usecases/search_usecase.dart';
@injectable
class SearchViewModel extends Cubit<SearchState>{
  SearchUseCase searchUseCase ;
  @factoryMethod
  SearchViewModel(this.searchUseCase):super(SearchInitState());
  search(String query) async {
    var result = await searchUseCase.search(query);
    return result.fold(
            (moviesList) => emit(SearchSuccessState(moviesList)),
            (error) => emit(SearchErrorState(error))
    );
  }

}
abstract class SearchState{}
class SearchInitState extends SearchState{}
class SearchLoadingState extends SearchState{}
class SearchErrorState extends SearchState{
  String? errorMessage ;
  SearchErrorState(this.errorMessage);
}
class SearchSuccessState extends SearchState{
  List<MoviesEntity>? moviesList ;
  SearchSuccessState(this.moviesList);
}