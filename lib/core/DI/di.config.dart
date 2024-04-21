// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource_contract/movies_details_datasource.dart' as _i10;
import '../../data/datasource_contract/movies_genres_datasource.dart' as _i16;
import '../../data/datasource_contract/new_releases_datasource.dart' as _i18;
import '../../data/datasource_contract/popular_movies_datasource.dart' as _i8;
import '../../data/datasource_contract/RecommendedMoviesDataSource.dart'
    as _i14;
import '../../data/datasource_contract/search_datasource_contract.dart' as _i22;
import '../../data/datasource_contract/similar_dataSource_contract.dart'
    as _i12;
import '../../data/datasource_contract/specific_genre_datasource.dart' as _i4;
import '../../data/datasource_impl/movies_details_datasource_impl.dart' as _i11;
import '../../data/datasource_impl/movies_genres_datasource_impl.dart' as _i17;
import '../../data/datasource_impl/new_releases_datasource_impl.dart' as _i19;
import '../../data/datasource_impl/popular_movies_datasource_impl.dart' as _i9;
import '../../data/datasource_impl/RecommendedMoviesDataSourceImpl.dart'
    as _i15;
import '../../data/datasource_impl/search_datasource_impl.dart' as _i23;
import '../../data/datasource_impl/similar_movies_datasource_impl.dart' as _i13;
import '../../data/datasource_impl/specific_genre_datasource_impl.dart' as _i5;
import '../../data/repository_impl/movies_detais_repo_impl.dart' as _i33;
import '../../data/repository_impl/movies_genres_repo_impl.dart' as _i26;
import '../../data/repository_impl/new_releases_repo_impl.dart' as _i39;
import '../../data/repository_impl/popular_movies_repo_impl.dart' as _i29;
import '../../data/repository_impl/recommended_Movies_repo_impl.dart' as _i21;
import '../../data/repository_impl/search_repo_impl.dart' as _i31;
import '../../data/repository_impl/similarMovies_repo_impl.dart' as _i35;
import '../../data/repository_impl/specific_genre_repo_impl.dart' as _i7;
import '../../domain/repository_contract/movies_details_repo.dart' as _i32;
import '../../domain/repository_contract/movies_genres_repo.dart' as _i25;
import '../../domain/repository_contract/new_releases_repo.dart' as _i38;
import '../../domain/repository_contract/popular_movies_repo.dart' as _i28;
import '../../domain/repository_contract/recommended_movies_repo.dart' as _i20;
import '../../domain/repository_contract/search_repo.dart' as _i30;
import '../../domain/repository_contract/similar_movies_repo.dart' as _i34;
import '../../domain/repository_contract/specific_genre_repo.dart' as _i6;
import '../../domain/usecases/movies_details_usecase.dart' as _i48;
import '../../domain/usecases/movies_genres_usecase.dart' as _i37;
import '../../domain/usecases/new_releases_use_case.dart' as _i49;
import '../../domain/usecases/popular_movies_usecase.dart' as _i36;
import '../../domain/usecases/recommended_movies_use_case.dart' as _i41;
import '../../domain/usecases/search_usecase.dart' as _i40;
import '../../domain/usecases/similar_movies_usecase.dart' as _i44;
import '../../domain/usecases/specific_genre_usecase.dart' as _i24;
import '../../presentation/home/details/movie_details/view_model/movie_details_viewmodel.dart'
    as _i50;
import '../../presentation/home/details/movie_details/view_model/similar_movie_viewmodel.dart'
    as _i47;
import '../../presentation/home/tabs/browse_tab/view_model/browse_tab_view_model.dart'
    as _i46;
import '../../presentation/home/tabs/browse_tab/view_model/genre_view_model.dart'
    as _i27;
import '../../presentation/home/tabs/home_tab/new_releases_movies/view_model/new_release_view_model.dart'
    as _i51;
import '../../presentation/home/tabs/home_tab/popular_movies/view_model/popular_movies_view_model.dart'
    as _i43;
import '../../presentation/home/tabs/home_tab/recommended_movies/view_model/recommended_movies_view_model.dart'
    as _i42;
import '../../presentation/home/tabs/search_tab/search_viewModel.dart' as _i45;
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
    gh.factory<_i10.MovieDetailsDataSource>(
        () => _i11.MovieDetailsDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i12.SimilarDatasourceContract>(
        () => _i13.SimilarDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i14.RecommendedMoviesDataSource>(
        () => _i15.RecommendedDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i16.MoviesGenresDataSource>(
        () => _i17.MoviesGenresDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i18.NewReleasesDataSource>(
        () => _i19.NewReleasesDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i20.RecommendedMoviesRepo>(() =>
        _i21.RecommendedMoviesRepoImpl(gh<_i14.RecommendedMoviesDataSource>()));
    gh.factory<_i22.SearchDatasourceContract>(
        () => _i23.SearchDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i24.SpecificGenreUseCase>(
        () => _i24.SpecificGenreUseCase(gh<_i6.SpecificGenreRepo>()));
    gh.factory<_i25.MoviesGenresRepo>(
        () => _i26.MoviesGenresRepoImpl(gh<_i16.MoviesGenresDataSource>()));
    gh.factory<_i27.GenreViewModel>(
        () => _i27.GenreViewModel(gh<_i24.SpecificGenreUseCase>()));
    gh.factory<_i28.PopularMoviesRepo>(
        () => _i29.PopularMoviesRepoImpl(gh<_i8.PopularMoviesDatasource>()));
    gh.factory<_i30.SearchRepo>(
        () => _i31.SearchRepoImpl(gh<_i22.SearchDatasourceContract>()));
    gh.factory<_i32.MovieDetailsRepo>(
        () => _i33.MoviesDetailsRepoImpl(gh<_i10.MovieDetailsDataSource>()));
    gh.factory<_i34.SimilarRepo>(
        () => _i35.SimilarRepoImpl(gh<_i12.SimilarDatasourceContract>()));
    gh.factory<_i36.PopularMoviesUseCase>(
        () => _i36.PopularMoviesUseCase(gh<_i28.PopularMoviesRepo>()));
    gh.factory<_i37.MoviesGenresUseCase>(
        () => _i37.MoviesGenresUseCase(gh<_i25.MoviesGenresRepo>()));
    gh.factory<_i38.NewReleasesRepo>(
        () => _i39.NewReleasesRepoImpl(gh<_i18.NewReleasesDataSource>()));
    gh.factory<_i40.SearchUseCase>(
        () => _i40.SearchUseCase(gh<_i30.SearchRepo>()));
    gh.factory<_i41.RecommendedMoviesUseCase>(
        () => _i41.RecommendedMoviesUseCase(gh<_i20.RecommendedMoviesRepo>()));
    gh.factory<_i42.RecommendedMoviesViewModel>(() =>
        _i42.RecommendedMoviesViewModel(gh<_i41.RecommendedMoviesUseCase>()));
    gh.factory<_i43.PopularMoviesViewModel>(
        () => _i43.PopularMoviesViewModel(gh<_i36.PopularMoviesUseCase>()));
    gh.factory<_i44.SimilarMovieUseCase>(
        () => _i44.SimilarMovieUseCase(gh<_i34.SimilarRepo>()));
    gh.factory<_i45.SearchViewModel>(
        () => _i45.SearchViewModel(gh<_i40.SearchUseCase>()));
    gh.factory<_i46.BrowseTabViewModel>(
        () => _i46.BrowseTabViewModel(gh<_i37.MoviesGenresUseCase>()));
    gh.factory<_i47.SimilarMoviesViewModel>(
        () => _i47.SimilarMoviesViewModel(gh<_i44.SimilarMovieUseCase>()));
    gh.factory<_i48.MovieDetailsUseCase>(
        () => _i48.MovieDetailsUseCase(gh<_i32.MovieDetailsRepo>()));
    gh.factory<_i49.NewReleasesUseCase>(
        () => _i49.NewReleasesUseCase(gh<_i38.NewReleasesRepo>()));
    gh.factory<_i50.MovieDetailsViewModel>(
        () => _i50.MovieDetailsViewModel(gh<_i48.MovieDetailsUseCase>()));
    gh.factory<_i51.NewReleasesMoviesViewModel>(
        () => _i51.NewReleasesMoviesViewModel(gh<_i49.NewReleasesUseCase>()));
    return this;
  }
}
