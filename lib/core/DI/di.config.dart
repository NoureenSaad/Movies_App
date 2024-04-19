// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource_contract/movies_genres_datasource.dart' as _i12;
import '../../data/datasource_contract/new_releases_datasource.dart' as _i14;
import '../../data/datasource_contract/popular_movies_datasource.dart' as _i8;
import '../../data/datasource_contract/RecommendedMoviesDataSource.dart'
    as _i10;
import '../../data/datasource_contract/specific_genre_datasource.dart' as _i4;
import '../../data/datasource_impl/movies_genres_datasource_impl.dart' as _i13;
import '../../data/datasource_impl/new_releases_datasource_impl.dart' as _i15;
import '../../data/datasource_impl/popular_movies_datasource_impl.dart' as _i9;
import '../../data/datasource_impl/RecommendedMoviesDataSourceImpl.dart'
    as _i11;
import '../../data/datasource_impl/specific_genre_datasource_impl.dart' as _i5;
import '../../data/repository_impl/movies_genres_repo_impl.dart' as _i20;
import '../../data/repository_impl/new_releases_repo_impl.dart' as _i27;
import '../../data/repository_impl/popular_movies_repo_impl.dart' as _i23;
import '../../data/repository_impl/recommended_Movies_repo_impl.dart' as _i17;
import '../../data/repository_impl/specific_genre_repo_impl.dart' as _i7;
import '../../domain/repository_contract/movies_genres_repo.dart' as _i19;
import '../../domain/repository_contract/new_releases_repo.dart' as _i26;
import '../../domain/repository_contract/popular_movies_repo.dart' as _i22;
import '../../domain/repository_contract/recommended_movies_repo.dart' as _i16;
import '../../domain/repository_contract/specific_genre_repo.dart' as _i6;
import '../../domain/usecases/movies_genres_usecase.dart' as _i25;
import '../../domain/usecases/new_releases_use_case.dart' as _i32;
import '../../domain/usecases/popular_movies_usecase.dart' as _i24;
import '../../domain/usecases/recommended_movies_use_case.dart' as _i28;
import '../../domain/usecases/specific_genre_usecase.dart' as _i18;
import '../../presentation/home/tabs/browse_tab/view_model/browse_tab_view_model.dart'
    as _i31;
import '../../presentation/home/tabs/browse_tab/view_model/genre_view_model.dart'
    as _i21;
import '../../presentation/home/tabs/home_tab/new_releases_movies/view_model/new_release_view_model.dart'
    as _i33;
import '../../presentation/home/tabs/home_tab/popular_movies/view_model/popular_movies_view_model.dart'
    as _i30;
import '../../presentation/home/tabs/home_tab/recommended_movies/view_model/recommended_movies_view_model.dart'
    as _i29;
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
    gh.factory<_i4.SpecificGenreDataSource>(
        () => _i5.SpecificGenreDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.SpecificGenreRepo>(
        () => _i7.SpecificGenreRepoImpl(gh<_i4.SpecificGenreDataSource>()));
    gh.factory<_i8.PopularMoviesDatasource>(
        () => _i9.PopularMoviesDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i10.RecommendedMoviesDataSource>(
        () => _i11.RecommendedDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i12.MoviesGenresDataSource>(
        () => _i13.MoviesGenresDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i14.NewReleasesDataSource>(
        () => _i15.NewReleasesDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i16.RecommendedMoviesRepo>(() =>
        _i17.RecommendedMoviesRepoImpl(gh<_i10.RecommendedMoviesDataSource>()));
    gh.factory<_i18.SpecificGenreUseCase>(
        () => _i18.SpecificGenreUseCase(gh<_i6.SpecificGenreRepo>()));
    gh.factory<_i19.MoviesGenresRepo>(
        () => _i20.MoviesGenresRepoImpl(gh<_i12.MoviesGenresDataSource>()));
    gh.factory<_i21.GenreViewModel>(
        () => _i21.GenreViewModel(gh<_i18.SpecificGenreUseCase>()));
    gh.factory<_i22.PopularMoviesRepo>(
        () => _i23.PopularMoviesRepoImpl(gh<_i8.PopularMoviesDatasource>()));
    gh.factory<_i24.PopularMoviesUseCase>(
        () => _i24.PopularMoviesUseCase(gh<_i22.PopularMoviesRepo>()));
    gh.factory<_i25.MoviesGenresUseCase>(
        () => _i25.MoviesGenresUseCase(gh<_i19.MoviesGenresRepo>()));
    gh.factory<_i26.NewReleasesRepo>(
        () => _i27.NewReleasesRepoImpl(gh<_i14.NewReleasesDataSource>()));
    gh.factory<_i28.RecommendedMoviesUseCase>(
        () => _i28.RecommendedMoviesUseCase(gh<_i16.RecommendedMoviesRepo>()));
    gh.factory<_i29.RecommendedMoviesViewModel>(() =>
        _i29.RecommendedMoviesViewModel(gh<_i28.RecommendedMoviesUseCase>()));
    gh.factory<_i30.PopularMoviesViewModel>(
        () => _i30.PopularMoviesViewModel(gh<_i24.PopularMoviesUseCase>()));
    gh.factory<_i31.BrowseTabViewModel>(
        () => _i31.BrowseTabViewModel(gh<_i25.MoviesGenresUseCase>()));
    gh.factory<_i32.NewReleasesUseCase>(
        () => _i32.NewReleasesUseCase(gh<_i26.NewReleasesRepo>()));
    gh.factory<_i33.NewReleasesMoviesViewModel>(
        () => _i33.NewReleasesMoviesViewModel(gh<_i32.NewReleasesUseCase>()));
    return this;
  }
}
