import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/MoviesEntity.dart';
import 'package:movies_app/domain/repository_contract/specific_genre_repo.dart';

import '../datasource_contract/specific_genre_datasource.dart';

@Injectable(as: SpecificGenreRepo)
class SpecificGenreRepoImpl extends SpecificGenreRepo{
  SpecificGenreDataSource genreDataSource;

  @factoryMethod
  SpecificGenreRepoImpl(this.genreDataSource);
  @override
  Future<Either<List<MoviesEntity>, String>> getSpecificGenre(String genreID) async{
    var result = await genreDataSource.getSpecificGenre(genreID);
    return result.fold(
            (response){
              var genreModelList = response.results??[];
              var genreEntityList = genreModelList.map((genre) => genre.toSpecificGenreEntity()).toList();
              return Left(genreEntityList);
            },
            (error){
              return Right(error.toString());
            });
  }

}