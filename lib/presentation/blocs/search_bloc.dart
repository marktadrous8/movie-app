import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_movies/presentation/blocs/search_event.dart';
import 'package:task_movies/presentation/blocs/search_state.dart';
import '../../data/models/movie_model.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final Future<List<MovieModel>> Function(String) searchMovies;

  SearchBloc({required this.searchMovies}) : super(SearchInitial()) {
    on<SearchMovies>(_onSearchMovies);
  }

  Future<void> _onSearchMovies(SearchMovies event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    try {
      final movies = await searchMovies(event.query);
      emit(SearchLoaded(movies: movies));
    } catch (e) {
      emit(SearchError(message: e.toString()));
    }
  }
}
