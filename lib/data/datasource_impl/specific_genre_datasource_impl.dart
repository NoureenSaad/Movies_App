import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/api/endpoints.dart';
import 'package:movies_app/data/datasource_contract/specific_genre_datasource.dart';
import 'package:movies_app/data/model/SpecificGenreResponse/SpecificGenreResponse.dart';

@Injectable(as: SpecificGenreDataSource)
class SpecificGenreDatasourceImpl extends SpecificGenreDataSource{
  ApiManager api;
  @factoryMethod
  SpecificGenreDatasourceImpl(this.api);
  @override
  Future<Either<SpecificGenreResponse, String>> getSpecificGenre(String genreID) async{
    try{
      var response = await api.getRequest(endpoint: Endpoints.getSpecificGenreListEndpoint,queryParameters: {"with_genres":genreID});
      SpecificGenreResponse genreResponse = SpecificGenreResponse.fromJson(response.data);
      return Left(genreResponse);
    }catch(error){
      return Right(error.toString());
    }
  }

}