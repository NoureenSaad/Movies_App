import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/api/endpoints.dart';
import 'package:movies_app/data/datasource_contract/movies_genres_datasource.dart';
import 'package:movies_app/data/model/MoviesGenresResponse/MoviesGenresResponse.dart';

@Injectable(as: MoviesGenresDataSource)
class MoviesGenresDataSourceImpl extends MoviesGenresDataSource{
  ApiManager apiManager;
  @factoryMethod
  MoviesGenresDataSourceImpl(this.apiManager);

  @override
  Future<Either<MoviesGenresResponse, String>> getMoviesGenres() async{
    try{
      var response = await apiManager.getRequest(endpoint: Endpoints.getMoviesListEndpoint);
      MoviesGenresResponse moviesGenresResponse = MoviesGenresResponse.fromJson(response.data);
      return Left(moviesGenresResponse);
    }catch(error){
      return Right(error.toString());
    }
  }

}