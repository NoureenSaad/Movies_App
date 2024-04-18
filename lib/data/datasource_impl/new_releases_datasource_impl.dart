import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/api/endpoints.dart';
import 'package:movies_app/data/datasource_contract/new_releases_datasource.dart';
import 'package:movies_app/data/model/new_releases_movies/New_releases_response.dart';

@Injectable(as: NewReleasesDataSource)
class NewReleasesDataSourceImpl extends NewReleasesDataSource {
  ApiManager apiManager;

  @factoryMethod
  NewReleasesDataSourceImpl(this.apiManager);

  @override
  Future<Either<NewReleasesResponse, String>> getNewReleases() async {
    try {
      var response = await apiManager.getRequest(
          endpoint: Endpoints.newReleasesMoviesEndPoint);
      NewReleasesResponse newReleasesResponse =
          NewReleasesResponse.fromJson(response.data);
      return Left(newReleasesResponse);
    } catch (error) {
      return Right(error.toString());
    }
  }

  //todo: start with new releases repo  
}
