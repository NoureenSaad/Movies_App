// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource_contract/movies_details_datasource.dart' as _i6;
import '../../data/datasource_contract/movies_genres_datasource.dart' as _i12;
import '../../data/datasource_contract/new_releases_datasource.dart' as _i14;
import '../../data/datasource_contract/popular_movies_datasource.dart' as _i4;
import '../../data/datasource_contract/RecommendedMoviesDataSource.dart'
    as _i10;
import '../../data/datasource_contract/search_datasource_contract.dart' as _i18;
import '../../data/datasource_contract/similar_dataSource_contract.dart' as _i8;
import '../../data/datasource_impl/movies_details_datasource_impl.dart' as _i7;
import '../../data/datasource_impl/movies_genres_datasource_impl.dart' as _i13;
import '../../data/datasource_impl/new_releases_datasource_impl.dart' as _i15;
import '../../data/datasource_impl/popular_movies_datasource_impl.dart' as _i5;
import '../../data/datasource_impl/RecommendedMoviesDataSourceImpl.dart'
    as _i11;
import '../../data/datasource_impl/search_datasource_impl.dart' as _i19;
import '../../data/datasource_impl/similar_movies_datasource_impl.dart' as _i9;
import '../../data/repository_impl/movies_detais_repo_impl.dart' as _i27;
import '../../data/repository_impl/movies_genres_repo_impl.dart' as _i21;
import '../../data/repository_impl/new_releases_repo_impl.dart' as _i33;
import '../../data/repository_impl/popular_movies_repo_impl.dart' as _i23;
import '../../data/repository_impl/recommended_Movies_repo_impl.dart' as _i17;
import '../../data/repository_impl/search_repo_impl.dart' as _i25;
import '../../data/repository_impl/similarMovies_repo_impl.dart' as _i29;
import '../../domain/repository_contract/movies_details_repo.dart' as _i26;
import '../../domain/repository_contract/movies_genres_repo.dart' as _i20;
import '../../domain/repository_contract/new_releases_repo.dart' as _i32;
import '../../domain/repository_contract/popular_movies_repo.dart' as _i22;
import '../../domain/repository_contract/recommended_movies_repo.dart' as _i16;
import '../../domain/repository_contract/search_repo.dart' as _i24;
import '../../domain/repository_contract/similar_movies_repo.dart' as _i28;
import '../../domain/usecases/movies_details_usecase.dart' as _i42;
import '../../domain/usecases/movies_genres_usecase.dart' as _i31;
import '../../domain/usecases/new_releases_use_case.dart' as _i43;
import '../../domain/usecases/popular_movies_usecase.dart' as _i30;
import '../../domain/usecases/recommended_movies_use_case.dart' as _i35;
import '../../domain/usecases/search_usecase.dart' as _i34;
import '../../domain/usecases/similar_movies_usecase.dart' as _i38;
import '../../presentation/home/details/movie_details/view_model/movie_details_viewmodel.dart'
    as _i44;
import '../../presentation/home/details/movie_details/view_model/similar_movie_viewmodel.dart'
    as _i41;
import '../../presentation/home/tabs/browse_tab/view_model/browse_tab_view_model.dart'
    as _i40;
import '../../presentation/home/tabs/home_tab/new_releases_movies/view_model/new_release_view_model.dart'
    as _i45;
import '../../presentation/home/tabs/home_tab/popular_movies/view_model/popular_movies_view_model.dart'
    as _i37;
import '../../presentation/home/tabs/home_tab/recommended_movies/view_model/recommended_movies_view_model.dart'
    as _i36;
import '../../presentation/home/tabs/search_tab/search_viewModel.dart' as _i39;
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
    gh.factory<_i6.MovieDetailsDataSource>(
        () => _i7.MovieDetailsDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i8.SimilarDatasourceContract>(
        () => _i9.SimilarDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i10.RecommendedMoviesDataSource>(
        () => _i11.RecommendedDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i12.MoviesGenresDataSource>(
        () => _i13.MoviesGenresDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i14.NewReleasesDataSource>(
        () => _i15.NewReleasesDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i16.RecommendedMoviesRepo>(() =>
        _i17.RecommendedMoviesRepoImpl(gh<_i10.RecommendedMoviesDataSource>()));
    gh.factory<_i18.SearchDatasourceContract>(
        () => _i19.SearchDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i20.MoviesGenresRepo>(
        () => _i21.MoviesGenresRepoImpl(gh<_i12.MoviesGenresDataSource>()));
    gh.factory<_i22.PopularMoviesRepo>(
        () => _i23.PopularMoviesRepoImpl(gh<_i4.PopularMoviesDatasource>()));
    gh.factory<_i24.SearchRepo>(
        () => _i25.SearchRepoImpl(gh<_i18.SearchDatasourceContract>()));
    gh.factory<_i26.MovieDetailsRepo>(
        () => _i27.MoviesDetailsRepoImpl(gh<_i6.MovieDetailsDataSource>()));
    gh.factory<_i28.SimilarRepo>(
        () => _i29.SimilarRepoImpl(gh<_i8.SimilarDatasourceContract>()));
    gh.factory<_i30.PopularMoviesUseCase>(
        () => _i30.PopularMoviesUseCase(gh<_i22.PopularMoviesRepo>()));
    gh.factory<_i31.MoviesGenresUseCase>(
        () => _i31.MoviesGenresUseCase(gh<_i20.MoviesGenresRepo>()));
    gh.factory<_i32.NewReleasesRepo>(
        () => _i33.NewReleasesRepoImpl(gh<_i14.NewReleasesDataSource>()));
    gh.factory<_i34.SearchUseCase>(
        () => _i34.SearchUseCase(gh<_i24.SearchRepo>()));
    gh.factory<_i35.RecommendedMoviesUseCase>(
        () => _i35.RecommendedMoviesUseCase(gh<_i16.RecommendedMoviesRepo>()));
    gh.factory<_i36.RecommendedMoviesViewModel>(() =>
        _i36.RecommendedMoviesViewModel(gh<_i35.RecommendedMoviesUseCase>()));
    gh.factory<_i37.PopularMoviesViewModel>(
        () => _i37.PopularMoviesViewModel(gh<_i30.PopularMoviesUseCase>()));
    gh.factory<_i38.SimilarMovieUseCase>(
        () => _i38.SimilarMovieUseCase(gh<_i28.SimilarRepo>()));
    gh.factory<_i39.SearchViewModel>(
        () => _i39.SearchViewModel(gh<_i34.SearchUseCase>()));
    gh.factory<_i40.BrowseTabViewModel>(
        () => _i40.BrowseTabViewModel(gh<_i31.MoviesGenresUseCase>()));
    gh.factory<_i41.SimilarMoviesViewModel>(
        () => _i41.SimilarMoviesViewModel(gh<_i38.SimilarMovieUseCase>()));
    gh.factory<_i42.MovieDetailsUseCase>(
        () => _i42.MovieDetailsUseCase(gh<_i26.MovieDetailsRepo>()));
    gh.factory<_i43.NewReleasesUseCase>(
        () => _i43.NewReleasesUseCase(gh<_i32.NewReleasesRepo>()));
    gh.factory<_i44.MovieDetailsViewModel>(
        () => _i44.MovieDetailsViewModel(gh<_i42.MovieDetailsUseCase>()));
    gh.factory<_i45.NewReleasesMoviesViewModel>(
        () => _i45.NewReleasesMoviesViewModel(gh<_i43.NewReleasesUseCase>()));
    return this;
  }
}
