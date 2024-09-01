// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:task_movies/register.dart' as _i10;
import 'package:task_movies/data/repositories/movie_repository.dart' as _i5;
import 'package:task_movies/data/services/api_service.dart' as _i4;
import 'package:task_movies/domain/use_cases/get_movies.dart' as _i7;
import 'package:task_movies/domain/use_cases/search_movie.dart' as _i6;
import 'package:task_movies/presentation/blocs/list_bloc.dart' as _i8;
import 'package:task_movies/presentation/blocs/search_bloc.dart' as _i9;

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
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i4.ApiService>(
        () => registerModule.provideApiService(gh<_i3.Dio>()));
    gh.lazySingleton<_i5.MovieRepository>(
        () => registerModule.provideMovieRepository(gh<_i4.ApiService>()));
    gh.lazySingleton<_i6.SearchMovies>(
        () => registerModule.provideSearchMovies(gh<_i5.MovieRepository>()));
    gh.factory<_i7.GetMovies>(() => _i7.GetMovies(gh<_i5.MovieRepository>()));
    gh.factory<_i8.ListBloc>(() => _i8.ListBloc(gh<_i7.GetMovies>()));
    gh.factory<_i9.SearchBloc>(
        () => registerModule.provideMovieSearchBloc(gh<_i6.SearchMovies>()));
    return this;
  }
}

class _$RegisterModule extends _i10.Register {}
