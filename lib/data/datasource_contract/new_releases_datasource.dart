import 'package:either_dart/either.dart';
import 'package:movies_app/data/model/new_releases_movies/New_releases_response.dart';


abstract class NewReleasesDataSource{
  Future<Either<NewReleasesResponse,String>> getNewReleases();
}