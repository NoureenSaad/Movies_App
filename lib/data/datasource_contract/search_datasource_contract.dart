import 'package:either_dart/either.dart';

import '../model/SearchModel/SearchResponse.dart';

abstract class SearchDatasourceContract{
  Future<Either<SearchResponse,String>> search(String query );
}