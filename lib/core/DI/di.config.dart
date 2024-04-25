// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource_contract/firestore_datasource.dart' as _i35;
import '../../data/datasource_contract/movies_details_datasource.dart' as _i11;
import '../../data/datasource_contract/movies_genres_datasource.dart' as _i17;
import '../../data/datasource_contract/new_releases_datasource.dart' as _i19;
import '../../data/datasource_contract/popular_movies_datasource.dart' as _i9;
import '../../data/datasource_contract/RecommendedMoviesDataSource.dart'
    as _i15;
import '../../data/datasource_contract/search_datasource_contract.dart' as _i23;
import '../../data/datasource_contract/similar_dataSource_contract.dart'
    as _i13;
import '../../data/datasource_contract/specific_genre_datasource.dart' as _i5;
import '../../data/datasource_impl/firestore_datasource_impl.dart' as _i36;
import '../../data/datasource_impl/movies_details_datasource_impl.dart' as _i12;
import '../../data/datasource_impl/movies_genres_datasource_impl.dart' as _i18;
import '../../data/datasource_impl/new_releases_datasource_impl.dart' as _i20;
import '../../data/datasource_impl/popular_movies_datasource_impl.dart' as _i10;
import '../../data/datasource_impl/RecommendedMoviesDataSourceImpl.dart'
    as _i16;
import '../../data/datasource_impl/search_datasource_impl.dart' as _i24;
import '../../data/datasource_impl/similar_movies_datasource_impl.dart' as _i14;
import '../../data/datasource_impl/specific_genre_datasource_impl.dart' as _i6;
import '../../data/repository_impl/firestore_repo_impl.dart' as _i53;
import '../../data/repository_impl/movies_detais_repo_impl.dart' as _i34;
import '../../data/repository_impl/movies_genres_repo_impl.dart' as _i27;
import '../../data/repository_impl/new_releases_repo_impl.dart' as _i42;
import '../../data/repository_impl/popular_movies_repo_impl.dart' as _i30;
import '../../data/repository_impl/recommended_Movies_repo_impl.dart' as _i22;
import '../../data/repository_impl/search_repo_impl.dart' as _i32;
import '../../data/repository_impl/similarMovies_repo_impl.dart' as _i38;
import '../../data/repository_impl/specific_genre_repo_impl.dart' as _i8;
import '../../domain/repository_contract/firestore_repo.dart' as _i52;
import '../../domain/repository_contract/movies_details_repo.dart' as _i33;
import '../../domain/repository_contract/movies_genres_repo.dart' as _i26;
import '../../domain/repository_contract/new_releases_repo.dart' as _i41;
import '../../domain/repository_contract/popular_movies_repo.dart' as _i29;
import '../../domain/repository_contract/recommended_movies_repo.dart' as _i21;
import '../../domain/repository_contract/search_repo.dart' as _i31;
import '../../domain/repository_contract/similar_movies_repo.dart' as _i37;
import '../../domain/repository_contract/specific_genre_repo.dart' as _i7;
import '../../domain/usecases/firestore_usecase.dart' as _i55;
import '../../domain/usecases/movies_details_usecase.dart' as _i51;
import '../../domain/usecases/movies_genres_usecase.dart' as _i40;
import '../../domain/usecases/new_releases_use_case.dart' as _i54;
import '../../domain/usecases/popular_movies_usecase.dart' as _i39;
import '../../domain/usecases/recommended_movies_use_case.dart' as _i44;
import '../../domain/usecases/search_usecase.dart' as _i43;
import '../../domain/usecases/similar_movies_usecase.dart' as _i47;
import '../../domain/usecases/specific_genre_usecase.dart' as _i25;
import '../../presentation/home/details/movie_details/view_model/movie_details_viewmodel.dart'
    as _i56;
import '../../presentation/home/details/movie_details/view_model/similar_movie_viewmodel.dart'
    as _i50;
import '../../presentation/home/tabs/browse_tab/view_model/browse_tab_view_model.dart'
    as _i49;
import '../../presentation/home/tabs/browse_tab/view_model/genre_view_model.dart'
    as _i28;
import '../../presentation/home/tabs/home_tab/new_releases_movies/view_model/new_release_view_model.dart'
    as _i57;
import '../../presentation/home/tabs/home_tab/popular_movies/view_model/popular_movies_view_model.dart'
    as _i46;
import '../../presentation/home/tabs/home_tab/recommended_movies/view_model/recommended_movies_view_model.dart'
    as _i45;
import '../../presentation/home/tabs/search_tab/search_viewModel.dart' as _i48;
import '../../presentation/home/tabs/watchlist_tab/view_model/watchlist_view_model.dart'
    as _i58;
import '../api/api_manager.dart' as _i3;
import '../firebase/helper/firestore_helper.dart' as _i4;

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
    gh.singleton<_i4.FireStoreHelper>(() => _i4.FireStoreHelper());
    gh.factory<_i5.SpecificGenreDataSource>(
        () => _i6.SpecificGenreDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i7.SpecificGenreRepo>(
        () => _i8.SpecificGenreRepoImpl(gh<_i5.SpecificGenreDataSource>()));
    gh.factory<_i9.PopularMoviesDatasource>(
        () => _i10.PopularMoviesDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i11.MovieDetailsDataSource>(
        () => _i12.MovieDetailsDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i13.SimilarDatasourceContract>(
        () => _i14.SimilarDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i15.RecommendedMoviesDataSource>(
        () => _i16.RecommendedDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i17.MoviesGenresDataSource>(
        () => _i18.MoviesGenresDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i19.NewReleasesDataSource>(
        () => _i20.NewReleasesDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i21.RecommendedMoviesRepo>(() =>
        _i22.RecommendedMoviesRepoImpl(gh<_i15.RecommendedMoviesDataSource>()));
    gh.factory<_i23.SearchDatasourceContract>(
        () => _i24.SearchDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i25.SpecificGenreUseCase>(
        () => _i25.SpecificGenreUseCase(gh<_i7.SpecificGenreRepo>()));
    gh.factory<_i26.MoviesGenresRepo>(
        () => _i27.MoviesGenresRepoImpl(gh<_i17.MoviesGenresDataSource>()));
    gh.factory<_i28.GenreViewModel>(
        () => _i28.GenreViewModel(gh<_i25.SpecificGenreUseCase>()));
    gh.factory<_i29.PopularMoviesRepo>(
        () => _i30.PopularMoviesRepoImpl(gh<_i9.PopularMoviesDatasource>()));
    gh.factory<_i31.SearchRepo>(
        () => _i32.SearchRepoImpl(gh<_i23.SearchDatasourceContract>()));
    gh.factory<_i33.MovieDetailsRepo>(
        () => _i34.MoviesDetailsRepoImpl(gh<_i11.MovieDetailsDataSource>()));
    gh.factory<_i35.FirestoreDataSource>(() => _i36.FirestoreDataSourceImpl(
        fireStoreHelper: gh<_i4.FireStoreHelper>()));
    gh.factory<_i37.SimilarRepo>(
        () => _i38.SimilarRepoImpl(gh<_i13.SimilarDatasourceContract>()));
    gh.factory<_i39.PopularMoviesUseCase>(
        () => _i39.PopularMoviesUseCase(gh<_i29.PopularMoviesRepo>()));
    gh.factory<_i40.MoviesGenresUseCase>(
        () => _i40.MoviesGenresUseCase(gh<_i26.MoviesGenresRepo>()));
    gh.factory<_i41.NewReleasesRepo>(
        () => _i42.NewReleasesRepoImpl(gh<_i19.NewReleasesDataSource>()));
    gh.factory<_i43.SearchUseCase>(
        () => _i43.SearchUseCase(gh<_i31.SearchRepo>()));
    gh.factory<_i44.RecommendedMoviesUseCase>(
        () => _i44.RecommendedMoviesUseCase(gh<_i21.RecommendedMoviesRepo>()));
    gh.factory<_i45.RecommendedMoviesViewModel>(() =>
        _i45.RecommendedMoviesViewModel(gh<_i44.RecommendedMoviesUseCase>()));
    gh.factory<_i46.PopularMoviesViewModel>(
        () => _i46.PopularMoviesViewModel(gh<_i39.PopularMoviesUseCase>()));
    gh.factory<_i47.SimilarMovieUseCase>(
        () => _i47.SimilarMovieUseCase(gh<_i37.SimilarRepo>()));
    gh.factory<_i48.SearchViewModel>(
        () => _i48.SearchViewModel(gh<_i43.SearchUseCase>()));
    gh.factory<_i49.BrowseTabViewModel>(
        () => _i49.BrowseTabViewModel(gh<_i40.MoviesGenresUseCase>()));
    gh.factory<_i50.SimilarMoviesViewModel>(
        () => _i50.SimilarMoviesViewModel(gh<_i47.SimilarMovieUseCase>()));
    gh.factory<_i51.MovieDetailsUseCase>(
        () => _i51.MovieDetailsUseCase(gh<_i33.MovieDetailsRepo>()));
    gh.factory<_i52.FirestoreRepo>(
        () => _i53.FirestoreRepoImpl(gh<_i35.FirestoreDataSource>()));
    gh.factory<_i54.NewReleasesUseCase>(
        () => _i54.NewReleasesUseCase(gh<_i41.NewReleasesRepo>()));
    gh.factory<_i55.FirestoreUseCase>(
        () => _i55.FirestoreUseCase(gh<_i52.FirestoreRepo>()));
    gh.factory<_i56.MovieDetailsViewModel>(
        () => _i56.MovieDetailsViewModel(gh<_i51.MovieDetailsUseCase>()));
    gh.factory<_i57.NewReleasesMoviesViewModel>(
        () => _i57.NewReleasesMoviesViewModel(gh<_i54.NewReleasesUseCase>()));
    gh.factory<_i58.WatchListViewModel>(
        () => _i58.WatchListViewModel(gh<_i55.FirestoreUseCase>()));
    return this;
  }
}
