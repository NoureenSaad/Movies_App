// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource_contract/firebase_datasource/firestore_datasource.dart'
    as _i25;
import '../../data/datasource_contract/firebase_datasource/login_datasource.dart'
    as _i39;
import '../../data/datasource_contract/firebase_datasource/register_datasource.dart'
    as _i35;
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
import '../../data/datasource_impl/firebase_datasource_impl/firestore_datasource_impl.dart'
    as _i26;
import '../../data/datasource_impl/firebase_datasource_impl/login_datasource_impl.dart'
    as _i40;
import '../../data/datasource_impl/firebase_datasource_impl/register_datasource_impl.dart'
    as _i36;
import '../../data/datasource_impl/movies_details_datasource_impl.dart' as _i12;
import '../../data/datasource_impl/movies_genres_datasource_impl.dart' as _i18;
import '../../data/datasource_impl/new_releases_datasource_impl.dart' as _i20;
import '../../data/datasource_impl/popular_movies_datasource_impl.dart' as _i10;
import '../../data/datasource_impl/RecommendedMoviesDataSourceImpl.dart'
    as _i16;
import '../../data/datasource_impl/search_datasource_impl.dart' as _i24;
import '../../data/datasource_impl/similar_movies_datasource_impl.dart' as _i14;
import '../../data/datasource_impl/specific_genre_datasource_impl.dart' as _i6;
import '../../data/repository_impl/firebase_repo_impl/firestore_repo_impl.dart'
    as _i42;
import '../../data/repository_impl/firebase_repo_impl/login_repo_impl.dart'
    as _i54;
import '../../data/repository_impl/firebase_repo_impl/register_repo_impl.dart'
    as _i56;
import '../../data/repository_impl/movies_detais_repo_impl.dart' as _i38;
import '../../data/repository_impl/movies_genres_repo_impl.dart' as _i29;
import '../../data/repository_impl/new_releases_repo_impl.dart' as _i48;
import '../../data/repository_impl/popular_movies_repo_impl.dart' as _i32;
import '../../data/repository_impl/recommended_Movies_repo_impl.dart' as _i22;
import '../../data/repository_impl/search_repo_impl.dart' as _i34;
import '../../data/repository_impl/similarMovies_repo_impl.dart' as _i44;
import '../../data/repository_impl/specific_genre_repo_impl.dart' as _i8;
import '../../domain/repository_contract/firebase_repo/firestore_repo.dart'
    as _i41;
import '../../domain/repository_contract/firebase_repo/login_repo.dart' as _i53;
import '../../domain/repository_contract/firebase_repo/register_repo.dart'
    as _i55;
import '../../domain/repository_contract/movies_details_repo.dart' as _i37;
import '../../domain/repository_contract/movies_genres_repo.dart' as _i28;
import '../../domain/repository_contract/new_releases_repo.dart' as _i47;
import '../../domain/repository_contract/popular_movies_repo.dart' as _i31;
import '../../domain/repository_contract/recommended_movies_repo.dart' as _i21;
import '../../domain/repository_contract/search_repo.dart' as _i33;
import '../../domain/repository_contract/similar_movies_repo.dart' as _i43;
import '../../domain/repository_contract/specific_genre_repo.dart' as _i7;
import '../../domain/usecases/firebase_usecases/firestore_usecase.dart' as _i59;
import '../../domain/usecases/firebase_usecases/login_usecase.dart' as _i66;
import '../../domain/usecases/firebase_usecases/register_usecase.dart' as _i57;
import '../../domain/usecases/movies_details_usecase.dart' as _i63;
import '../../domain/usecases/movies_genres_usecase.dart' as _i46;
import '../../domain/usecases/new_releases_use_case.dart' as _i65;
import '../../domain/usecases/popular_movies_usecase.dart' as _i45;
import '../../domain/usecases/recommended_movies_use_case.dart' as _i50;
import '../../domain/usecases/search_usecase.dart' as _i49;
import '../../domain/usecases/similar_movies_usecase.dart' as _i58;
import '../../domain/usecases/specific_genre_usecase.dart' as _i27;
import '../../presentation/auth/login/viewmodel/login_viewmodel.dart' as _i70;
import '../../presentation/auth/register/viewmodel/register_viewmodel.dart'
    as _i67;
import '../../presentation/home/details/movie_details/view_model/movie_details_viewmodel.dart'
    as _i68;
import '../../presentation/home/details/movie_details/view_model/similar_movie_viewmodel.dart'
    as _i62;
import '../../presentation/home/tabs/browse_tab/view_model/browse_tab_view_model.dart'
    as _i61;
import '../../presentation/home/tabs/browse_tab/view_model/genre_view_model.dart'
    as _i30;
import '../../presentation/home/tabs/home_tab/new_releases_movies/view_model/new_release_view_model.dart'
    as _i69;
import '../../presentation/home/tabs/home_tab/popular_movies/view_model/popular_movies_view_model.dart'
    as _i52;
import '../../presentation/home/tabs/home_tab/recommended_movies/view_model/recommended_movies_view_model.dart'
    as _i51;
import '../../presentation/home/tabs/search_tab/search_viewModel.dart' as _i60;
import '../../presentation/home/tabs/watchlist_tab/view_model/watchlist_view_model.dart'
    as _i64;
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
    gh.factory<_i25.FirestoreDataSource>(() => _i26.FirestoreDataSourceImpl(
        fireStoreHelper: gh<_i4.FireStoreHelper>()));
    gh.factory<_i27.SpecificGenreUseCase>(
        () => _i27.SpecificGenreUseCase(gh<_i7.SpecificGenreRepo>()));
    gh.factory<_i28.MoviesGenresRepo>(
        () => _i29.MoviesGenresRepoImpl(gh<_i17.MoviesGenresDataSource>()));
    gh.factory<_i30.GenreViewModel>(
        () => _i30.GenreViewModel(gh<_i27.SpecificGenreUseCase>()));
    gh.factory<_i31.PopularMoviesRepo>(
        () => _i32.PopularMoviesRepoImpl(gh<_i9.PopularMoviesDatasource>()));
    gh.factory<_i33.SearchRepo>(
        () => _i34.SearchRepoImpl(gh<_i23.SearchDatasourceContract>()));
    gh.factory<_i35.RegisterDataSource>(
        () => _i36.registerDataSourceImpl(gh<_i4.FireStoreHelper>()));
    gh.factory<_i37.MovieDetailsRepo>(
        () => _i38.MoviesDetailsRepoImpl(gh<_i11.MovieDetailsDataSource>()));
    gh.factory<_i39.LoginDataSource>(
        () => _i40.LoginDataSourceImpl(gh<_i4.FireStoreHelper>()));
    gh.factory<_i41.FirestoreRepo>(
        () => _i42.FirestoreRepoImpl(gh<_i25.FirestoreDataSource>()));
    gh.factory<_i43.SimilarRepo>(
        () => _i44.SimilarRepoImpl(gh<_i13.SimilarDatasourceContract>()));
    gh.factory<_i45.PopularMoviesUseCase>(
        () => _i45.PopularMoviesUseCase(gh<_i31.PopularMoviesRepo>()));
    gh.factory<_i46.MoviesGenresUseCase>(
        () => _i46.MoviesGenresUseCase(gh<_i28.MoviesGenresRepo>()));
    gh.factory<_i47.NewReleasesRepo>(
        () => _i48.NewReleasesRepoImpl(gh<_i19.NewReleasesDataSource>()));
    gh.factory<_i49.SearchUseCase>(
        () => _i49.SearchUseCase(gh<_i33.SearchRepo>()));
    gh.factory<_i50.RecommendedMoviesUseCase>(
        () => _i50.RecommendedMoviesUseCase(gh<_i21.RecommendedMoviesRepo>()));
    gh.factory<_i51.RecommendedMoviesViewModel>(() =>
        _i51.RecommendedMoviesViewModel(gh<_i50.RecommendedMoviesUseCase>()));
    gh.factory<_i52.PopularMoviesViewModel>(
        () => _i52.PopularMoviesViewModel(gh<_i45.PopularMoviesUseCase>()));
    gh.factory<_i53.LoginRepo>(
        () => _i54.LoginRepositoryImpl(gh<_i39.LoginDataSource>()));
    gh.factory<_i55.RegisterRepo>(() => _i56.registerRepositoryImpl(
        registerDataSource: gh<_i35.RegisterDataSource>()));
    gh.factory<_i57.RegisterUseCase>(
        () => _i57.RegisterUseCase(gh<_i55.RegisterRepo>()));
    gh.factory<_i58.SimilarMovieUseCase>(
        () => _i58.SimilarMovieUseCase(gh<_i43.SimilarRepo>()));
    gh.factory<_i59.FirestoreUseCase>(
        () => _i59.FirestoreUseCase(gh<_i41.FirestoreRepo>()));
    gh.factory<_i60.SearchViewModel>(
        () => _i60.SearchViewModel(gh<_i49.SearchUseCase>()));
    gh.factory<_i61.BrowseTabViewModel>(
        () => _i61.BrowseTabViewModel(gh<_i46.MoviesGenresUseCase>()));
    gh.factory<_i62.SimilarMoviesViewModel>(
        () => _i62.SimilarMoviesViewModel(gh<_i58.SimilarMovieUseCase>()));
    gh.factory<_i63.MovieDetailsUseCase>(
        () => _i63.MovieDetailsUseCase(gh<_i37.MovieDetailsRepo>()));
    gh.factory<_i64.WatchListViewModel>(
        () => _i64.WatchListViewModel(gh<_i59.FirestoreUseCase>()));
    gh.factory<_i65.NewReleasesUseCase>(
        () => _i65.NewReleasesUseCase(gh<_i47.NewReleasesRepo>()));
    gh.factory<_i66.LoginUseCase>(
        () => _i66.LoginUseCase(gh<_i53.LoginRepo>()));
    gh.factory<_i67.RegisterViewModel>(
        () => _i67.RegisterViewModel(gh<_i57.RegisterUseCase>()));
    gh.factory<_i68.MovieDetailsViewModel>(
        () => _i68.MovieDetailsViewModel(gh<_i63.MovieDetailsUseCase>()));
    gh.factory<_i69.NewReleasesMoviesViewModel>(
        () => _i69.NewReleasesMoviesViewModel(gh<_i65.NewReleasesUseCase>()));
    gh.factory<_i70.loginViewModel>(
        () => _i70.loginViewModel(gh<_i66.LoginUseCase>()));
    return this;
  }
}
