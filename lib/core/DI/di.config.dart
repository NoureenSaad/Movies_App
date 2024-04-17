// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource_contract/movies_genres_datasource.dart' as _i6;
import '../../data/datasource_contract/popular_movies_datasource.dart' as _i4;
import '../../data/datasource_impl/movies_genres_datasource_impl.dart' as _i7;
import '../../data/datasource_impl/popular_movies_datasource_impl.dart' as _i5;
import '../../data/repository_impl/movies_genres_repo_impl.dart' as _i9;
import '../../data/repository_impl/popular_movies_repo_impl.dart' as _i11;
import '../../domain/repository_contract/movies_genres_repo.dart' as _i8;
import '../../domain/repository_contract/popular_movies_repo.dart' as _i10;
import '../../domain/usecases/movies_genres_usecase.dart' as _i13;
import '../../domain/usecases/popular_movies_usecase.dart' as _i12;
import '../../data/datasource_contract/movies_genres_datasource.dart' as _i4;
import '../../data/datasource_contract/new_releases_datasource.dart' as _i6;
import '../../data/datasource_impl/movies_genres_datasource_impl.dart' as _i5;
import '../../data/datasource_impl/new_releases_datasource_impl.dart' as _i7;
import '../../data/repository_impl/movies_genres_repo_impl.dart' as _i9;
import '../../data/repository_impl/new_releases_repo_impl.dart' as _i12;
import '../../domain/repository_contract/movies_genres_repo.dart' as _i8;
import '../../domain/repository_contract/new_releases_repo.dart' as _i11;
import '../../domain/usecases/movies_genres_usecase.dart' as _i10;
import '../../domain/usecases/new_releases_use_case.dart' as _i14;
import '../../presentation/home/tabs/browse_tab/view_model/browse_tab_view_model.dart'
    as _i15;
import '../../presentation/home/tabs/home_tab/popular_movies/view_model/popular_movies_view_model.dart'
    as _i14;
    as _i13;
import '../../presentation/home/tabs/home_tab/new_releases_movies/view_model/new_release_view_model.dart'
    as _i15;
import '../api/api_manager.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.PopularMoviesDatasource>(
        () => _i5.PopularMoviesDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.MoviesGenresDataSource>(
        () => _i7.MoviesGenresDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i8.MoviesGenresRepo>(
        () => _i9.MoviesGenresRepoImpl(gh<_i6.MoviesGenresDataSource>()));
    gh.factory<_i10.PopularMoviesRepo>(
        () => _i11.PopularMoviesRepoImpl(gh<_i4.PopularMoviesDatasource>()));
    gh.factory<_i12.PopularMoviesUseCase>(
        () => _i12.PopularMoviesUseCase(gh<_i10.PopularMoviesRepo>()));
    gh.factory<_i13.MoviesGenresUseCase>(
        () => _i13.MoviesGenresUseCase(gh<_i8.MoviesGenresRepo>()));
    gh.factory<_i14.PopularMoviesViewModel>(
        () => _i14.PopularMoviesViewModel(gh<_i12.PopularMoviesUseCase>()));
    gh.factory<_i15.BrowseTabViewModel>(
        () => _i15.BrowseTabViewModel(gh<_i13.MoviesGenresUseCase>()));
    return this;
  }
}
