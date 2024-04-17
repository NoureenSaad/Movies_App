import 'package:either_dart/src/either.dart';
import 'package:movies_app/data/datasource_contract/specific_genre_datasource.dart';
import 'package:movies_app/data/model/SpecificGenreResponse/SpecificGenreResponse.dart';

class SpecificGenreDatasourceImpl extends SpecificGenreDataSource{
  @override
  Future<Either<SpecificGenreResponse, String>> getSpecificGenre() {
    // TODO: implement getSpecificGenre
    throw UnimplementedError();
  }

}