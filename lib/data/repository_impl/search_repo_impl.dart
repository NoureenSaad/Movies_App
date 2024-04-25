import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/MoviesEntity.dart';
import '../../domain/repository_contract/search_repo.dart';
import '../datasource_contract/search_datasource_contract.dart';
@Injectable(as:SearchRepo)
class SearchRepoImpl extends SearchRepo{
  SearchDatasourceContract searchDatasourceContract ;
  @factoryMethod
  SearchRepoImpl(this.searchDatasourceContract);
  @override
  Future<Either<List<MoviesEntity>, String>> search(String query) async {
    var searchResult = await searchDatasourceContract.search( query);
    return searchResult.fold(
            (response){
          var responseList = response.results??[];
          var searchList = responseList.map((search) => MoviesEntity(
            title: search.title,
            overview: search.overview,
            adult: search.adult,
            releaseDate: search.releaseDate,
            posterPath: search.posterPath,
            backdropPath: search.backdropPath,
            id: search.id,
            voteAverage: search.voteAverage,
          )).toList();
          print('searchList : $searchList');
          return Left(searchList);

        },
            (error) => Right(error)
    );
  }

}