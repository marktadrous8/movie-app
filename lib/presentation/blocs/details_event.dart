import '../../../domain/entities/movie.dart';

abstract class DetailsEvent {}

class SelectMovie extends DetailsEvent {
  final Movie movie;

  SelectMovie(this.movie);
}
