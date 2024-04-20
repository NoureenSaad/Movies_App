import '../../../../../domain/entities/MoviesEntity.dart';

class WatchListViewModel{

}

abstract class WatchlistState{}

class WatchlistInitialState extends WatchlistState {}
class WatchlistLoadingState extends WatchlistState {}
class WatchlistErrorState extends WatchlistState {
  String? error ;
  WatchlistErrorState(this.error);
}
class WatchlistSuccessState extends WatchlistState {
  List<MoviesEntity>? movies;
  WatchlistSuccessState(this.movies);
}