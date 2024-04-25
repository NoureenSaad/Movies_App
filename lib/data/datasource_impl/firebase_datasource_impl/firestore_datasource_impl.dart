import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/firebase/helper/firestore_helper.dart';
import 'package:movies_app/data/datasource_contract/firebase_datasource/firestore_datasource.dart';
import 'package:movies_app/domain/entities/MoviesEntity.dart';

@Injectable(as: FirestoreDataSource)
class FirestoreDataSourceImpl extends FirestoreDataSource{
  FireStoreHelper fireStoreHelper;
  @factoryMethod
  FirestoreDataSourceImpl({required this.fireStoreHelper});
  @override
  Future<Either<Stream<List<MoviesEntity>>, String>> getMovies({required String userID}) async{
    try{
      var response = fireStoreHelper.ListenToWatchList(userID);
      Stream<List<MoviesEntity>> result = response;
      return Left(result);
    }catch(error){
      return Right(error.toString());
    }
  }

}