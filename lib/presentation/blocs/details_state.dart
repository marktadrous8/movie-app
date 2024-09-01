import '../../../domain/entities/movie.dart';

abstract class DetailsState {}

class DetailsInitial extends DetailsState {}

class DetailsLoaded extends DetailsState {
  final Movie movie;

  DetailsLoaded(this.movie);
}
