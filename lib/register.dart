import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'data/repositories/movie_repository.dart';
import 'data/services/api_service.dart';
import 'domain/use_cases/search_movie.dart';
import 'presentation/blocs/search_bloc.dart';

@module
abstract class Register {
  @lazySingleton
  Dio get dio => Dio();

  @lazySingleton
  ApiService provideApiService(Dio dio) => ApiService(dio);

  @lazySingleton
  MovieRepository provideMovieRepository(ApiService apiService) => MovieRepository(apiService);

  @lazySingleton
  SearchMovies provideSearchMovies(MovieRepository movieRepository) => SearchMovies(movieRepository);

  @factoryMethod
  SearchBloc provideMovieSearchBloc(SearchMovies searchMovies) => SearchBloc(searchMovies: searchMovies.call);
}
