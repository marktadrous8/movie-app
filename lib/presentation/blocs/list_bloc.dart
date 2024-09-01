import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/get_movies.dart';
import 'list_event.dart';
import 'list_state.dart';

@injectable
class ListBloc extends Bloc<ListEvent, ListState> {
  final GetMovies getMovies;

  ListBloc(this.getMovies) : super(ListInitial()) {
    on<FetchMovies>((event, emit) async {
      emit(ListLoading());
      try {
        final movies = await getMovies();
        emit(ListLoaded(movies));
      } catch (_) {
        emit(ListError());
      }
    });
  }
}
