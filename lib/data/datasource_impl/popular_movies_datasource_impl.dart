import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/api/endpoints.dart';
import 'package:movies_app/data/datasource_contract/popular_movies_datasource.dart';
import 'package:movies_app/data/model/popular_movies_response/Popular_movies_response.dart';

@Injectable(as: PopularMoviesDatasource)
class PopularMoviesDataSourceImpl extends PopularMoviesDatasource {
  ApiManager apiManager;

  @factoryMethod
  PopularMoviesDataSourceImpl(this.apiManager);

  @override
  Future<Either<PopularMoviesResponse, String>> getPopularMovies() async {
    try {
      var response = await apiManager.getRequest(
          endpoint: Endpoints.popularMoviesEndpoint);
      PopularMoviesResponse popularMoviesResponse =
          PopularMoviesResponse.fromJson(response.data);
      return Left(popularMoviesResponse);
    } catch (error) {
      return Right(error.toString());
    }
  }
}
