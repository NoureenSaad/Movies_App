import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../../core/api/api_manager.dart';
import '../../core/api/endpoints.dart';
import '../../core/constants.dart';
import '../datasource_contract/similar_dataSource_contract.dart';
import '../model/SimilarMoviesResponse/similarResponse.dart';
@Injectable(as: SimilarDatasourceContract)
class SimilarDataSourceImpl extends SimilarDatasourceContract{
  ApiManager apiManager ;
  @factoryMethod
  SimilarDataSourceImpl(this.apiManager);
  @override
  Future<Either<SimilarResponse,String>> getSimilarMovies(int movieId) async {
    try{
    var response =   await apiManager.getRequest(
          endpoint: "${Endpoints.getMovieDetailsEndpoint}/${movieId}/similar",queryParameters: {"api_key":Constants.apiKey});
    var similarResponse = SimilarResponse.fromJson(response.data);
      return Left(similarResponse);
    }catch(error){
      return Right(error.toString());
    }
  }

}