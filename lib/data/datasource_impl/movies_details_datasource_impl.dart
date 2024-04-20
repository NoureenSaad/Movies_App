import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/api/endpoints.dart';
import 'package:movies_app/core/constants.dart';
import 'package:movies_app/data/datasource_contract/movies_details_datasource.dart';

import '../model/MovieDetailsResponse/MovieDetailsResponse.dart';

@Injectable(as: MovieDetailsDataSource)
class MovieDetailsDataSourceImpl extends MovieDetailsDataSource {
  ApiManager apiManager;

  @factoryMethod
  MovieDetailsDataSourceImpl(this.apiManager);

  @override
  Future<Either<MovieDetailsResponse, String>> getMovieDetails(int  movieId) async {
    try {
      var response = await apiManager.getRequest(
          endpoint: "${Endpoints.getMovieDetailsEndpoint}/${movieId}" ,queryParameters: {"api_key":Constants.apiKey});
      MovieDetailsResponse movieDetailsResponse =
      MovieDetailsResponse.fromJson(response.data);
      return Left(movieDetailsResponse);
    } catch (error) {
      print("abcd $error");
      return Right(error.toString());
    }
  }
}
