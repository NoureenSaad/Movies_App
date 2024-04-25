import 'dart:async';


import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


import '../../../../../domain/entities/MoviesEntity.dart';
import '../../../../../domain/usecases/firebase_usecases/firestore_usecase.dart';

@injectable
class WatchListViewModel extends Cubit<WatchlistState>{
  FirestoreUseCase firestoreUseCase;
  @factoryMethod
  WatchListViewModel(this.firestoreUseCase):super(WatchlistInitialState());

  getMovies(String userID){
    emit(WatchlistLoadingState());
    var result = firestoreUseCase.getMovies(userID);
    result.fold(
        (response){
          emit(WatchlistSuccessState(response));
        },
        (error){
          emit(WatchlistErrorState(error));
        }
    );
  }

}

abstract class WatchlistState{}

class WatchlistInitialState extends WatchlistState {}
class WatchlistLoadingState extends WatchlistState {}
class WatchlistErrorState extends WatchlistState {
  String? error ;
  WatchlistErrorState(this.error);
}
class WatchlistSuccessState extends WatchlistState {
  Stream<List<MoviesEntity>> movies;
  WatchlistSuccessState(this.movies);
}