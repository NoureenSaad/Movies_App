// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource_contract/movies_genres_datasource.dart' as _i4;
import '../../data/datasource_impl/movies_genres_datasource_impl.dart' as _i5;
import '../../data/repository_impl/movies_genres_repo_impl.dart' as _i7;
import '../../domain/repository_contract/movies_genres_repo.dart' as _i6;
import '../../domain/usecases/movies_genres_usecase.dart' as _i8;
import '../../presentation/home/tabs/browse_tab/view_model/browse_tab_view_model.dart'
    as _i9;
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
    gh.factory<_i4.MoviesGenresDataSource>(
        () => _i5.MoviesGenresDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.MoviesGenresRepo>(
        () => _i7.MoviesGenresRepoImpl(gh<_i4.MoviesGenresDataSource>()));
    gh.factory<_i8.MoviesGenresUseCase>(
        () => _i8.MoviesGenresUseCase(gh<_i6.MoviesGenresRepo>()));
    gh.factory<_i9.BrowseTabViewModel>(
        () => _i9.BrowseTabViewModel(gh<_i8.MoviesGenresUseCase>()));
    return this;
  }
}
