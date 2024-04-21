// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource_contract/movies_genres_datasource.dart' as _i8;
import '../../data/datasource_contract/new_releases_datasource.dart' as _i10;
import '../../data/datasource_contract/popular_movies_datasource.dart' as _i4;
import '../../data/datasource_contract/RecommendedMoviesDataSource.dart' as _i6;
import '../../data/datasource_impl/movies_genres_datasource_impl.dart' as _i9;
import '../../data/datasource_impl/new_releases_datasource_impl.dart' as _i11;
import '../../data/datasource_impl/popular_movies_datasource_impl.dart' as _i5;
import '../../data/datasource_impl/RecommendedMoviesDataSourceImpl.dart' as _i7;
import '../../data/repository_impl/movies_genres_repo_impl.dart' as _i15;
import '../../data/repository_impl/new_releases_repo_impl.dart' as _i21;
import '../../data/repository_impl/popular_movies_repo_impl.dart' as _i17;
import '../../data/repository_impl/recommended_Movies_repo_impl.dart' as _i13;
import '../../domain/repository_contract/movies_genres_repo.dart' as _i14;
import '../../domain/repository_contract/new_releases_repo.dart' as _i20;
import '../../domain/repository_contract/popular_movies_repo.dart' as _i16;
import '../../domain/repository_contract/recommended_movies_repo.dart' as _i12;
import '../../domain/usecases/movies_genres_usecase.dart' as _i19;
import '../../domain/usecases/new_releases_use_case.dart' as _i26;
import '../../domain/usecases/popular_movies_usecase.dart' as _i18;
import '../../domain/usecases/recommended_movies_use_case.dart' as _i22;
import '../../presentation/home/tabs/browse_tab/view_model/browse_tab_view_model.dart'
    as _i25;
import '../../presentation/home/tabs/home_tab/new_releases_movies/view_model/new_release_view_model.dart'
    as _i27;
import '../../presentation/home/tabs/home_tab/popular_movies/view_model/popular_movies_view_model.dart'
    as _i24;
import '../../presentation/home/tabs/home_tab/recommended_movies/view_model/recommended_movies_view_model.dart'
    as _i23;
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
    gh.factory<_i6.RecommendedMoviesDataSource>(
        () => _i7.RecommendedDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i8.MoviesGenresDataSource>(
        () => _i9.MoviesGenresDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i10.NewReleasesDataSource>(
        () => _i11.NewReleasesDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i12.RecommendedMoviesRepo>(() =>
        _i13.RecommendedMoviesRepoImpl(gh<_i6.RecommendedMoviesDataSource>()));
    gh.factory<_i14.MoviesGenresRepo>(
        () => _i15.MoviesGenresRepoImpl(gh<_i8.MoviesGenresDataSource>()));
    gh.factory<_i16.PopularMoviesRepo>(
        () => _i17.PopularMoviesRepoImpl(gh<_i4.PopularMoviesDatasource>()));
    gh.factory<_i18.PopularMoviesUseCase>(
        () => _i18.PopularMoviesUseCase(gh<_i16.PopularMoviesRepo>()));
    gh.factory<_i19.MoviesGenresUseCase>(
        () => _i19.MoviesGenresUseCase(gh<_i14.MoviesGenresRepo>()));
    gh.factory<_i20.NewReleasesRepo>(
        () => _i21.NewReleasesRepoImpl(gh<_i10.NewReleasesDataSource>()));
    gh.factory<_i22.RecommendedMoviesUseCase>(
        () => _i22.RecommendedMoviesUseCase(gh<_i12.RecommendedMoviesRepo>()));
    gh.factory<_i23.RecommendedMoviesViewModel>(() =>
        _i23.RecommendedMoviesViewModel(gh<_i22.RecommendedMoviesUseCase>()));
    gh.factory<_i24.PopularMoviesViewModel>(
        () => _i24.PopularMoviesViewModel(gh<_i18.PopularMoviesUseCase>()));
    gh.factory<_i25.BrowseTabViewModel>(
        () => _i25.BrowseTabViewModel(gh<_i19.MoviesGenresUseCase>()));
    gh.factory<_i26.NewReleasesUseCase>(
        () => _i26.NewReleasesUseCase(gh<_i20.NewReleasesRepo>()));
    gh.factory<_i27.NewReleasesMoviesViewModel>(
        () => _i27.NewReleasesMoviesViewModel(gh<_i26.NewReleasesUseCase>()));
    return this;
  }
}
