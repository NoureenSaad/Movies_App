

import 'package:either_dart/either.dart';

import 'package:injectable/injectable.dart';
import '../../core/api/api_manager.dart';
import '../../core/api/endpoints.dart';
import '../../core/constants.dart';
import '../datasource_contract/search_datasource_contract.dart';
import '../model/SearchModel/SearchResponse.dart';

@Injectable(as: SearchDatasourceContract)
class SearchDatasourceImpl extends SearchDatasourceContract {
  ApiManager apiManager;

  @factoryMethod
  SearchDatasourceImpl(this.apiManager);

  @override
  Future<Either<SearchResponse, String>> search(String query) async {
    try {
      var response = await apiManager.getRequest(
          endpoint: "${Endpoints.searchMovie}",
          queryParameters: {"api_key": Constants.apiKey, "query": query});
      var searchResponse = SearchResponse.fromJson(response.data);
      return Left(searchResponse);
    } catch (error) {
      print(error);
      return Right(error.toString());
    }
  }
}
