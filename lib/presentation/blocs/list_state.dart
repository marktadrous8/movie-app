import '../../domain/entities/movie.dart';

abstract class ListState {}

class ListInitial extends ListState {}

class ListLoading extends ListState {}

class ListLoaded extends ListState {
  final List<Movie> movies;

  ListLoaded(this.movies);
}

class ListError extends ListState {}
