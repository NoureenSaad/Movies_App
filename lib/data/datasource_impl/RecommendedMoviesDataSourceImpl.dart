import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/api/endpoints.dart';

import 'package:movies_app/data/model/recommended_movies_response/RecommendedMoviesResponse.dart';

import '../datasource_contract/RecommendedMoviesDataSource.dart';

@Injectable(as: RecommendedMoviesDataSource)
class RecommendedDataSourceImpl extends RecommendedMoviesDataSource {
  ApiManager apiManager;

  @factoryMethod
  RecommendedDataSourceImpl(this.apiManager);

  @override
  Future<Either<RecommendedMoviesResponse, String>>
      getRecommendedMovies() async {
    try {
      var response =
          await apiManager.getRequest(endpoint: Endpoints.recommendedEndpoint);
      RecommendedMoviesResponse recommendedMoviesResponse =
          RecommendedMoviesResponse.fromJson(response.data);
      return Left(recommendedMoviesResponse);
    } catch (error) {
      return Right(error.toString());
    }
  }
}
