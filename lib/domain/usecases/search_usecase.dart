import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../entities/MoviesEntity.dart';
import '../repository_contract/search_repo.dart';
@injectable
class SearchUseCase{
  SearchRepo searchRepo ;
  @factoryMethod
  SearchUseCase(this.searchRepo);
  Future<Either<List<MoviesEntity>, String>> search(String query){
    return searchRepo.search(query);
  }

}