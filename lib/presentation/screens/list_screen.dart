import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_movies/presentation/ui/item.dart';
import '../../../domain/entities/movie.dart';
import '../blocs/list_bloc.dart';
import '../blocs/list_state.dart';
import '../blocs/search_bloc.dart';
import '../blocs/search_event.dart';
import '../blocs/search_state.dart';
import 'details_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  bool _isGrid = true;
  int _crossAxisCount = 3;

  void _toggleView() {
    setState(() {
      if (_isGrid && _crossAxisCount == 3) {
        _crossAxisCount = 2;
      } else if (_isGrid && _crossAxisCount == 2) {
        _isGrid = false;
        _crossAxisCount = 1;
      } else {
        _isGrid = true;
        _crossAxisCount = 3;
      }
    });
  }

  void _onSearchSubmitted(String query) {
    if (query.isNotEmpty) {
      setState(() {
        _isSearching = true;
      });
      context.read<SearchBloc>().add(SearchMovies(query));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _isSearching ? _buildSearchResults() : _buildMovieList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleView,
        child: Icon(_isGrid
            ? (_crossAxisCount == 3 ? Icons.grid_view : Icons.view_comfy)
            : Icons.view_list),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () => _onSearchSubmitted(_searchController.text),
          ),
        ),
        onChanged: _onSearchSubmitted,
      ),
    );
  }

  Widget _buildSearchResults() {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return _buildLoadingIndicator();
        } else if (state is SearchLoaded) {
          return _buildMovieGrid(state.movies);
        } else if (state is SearchError) {
          return _buildErrorText('Failed to load movies');
        }
        return _buildPlaceholderText('Start searching for movies');
      },
    );
  }

  Widget _buildMovieList() {
    return BlocBuilder<ListBloc, ListState>(
      builder: (context, state) {
        if (state is ListLoading) {
          return _buildLoadingIndicator();
        } else if (state is ListLoaded) {
          return _buildMovieGrid(state.movies);
        } else if (state is ListError) {
          return _buildErrorText('Failed to load movies');
        }
        return Container();
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildErrorText(String message) {
    return Center(child: Text(message));
  }

  Widget _buildPlaceholderText(String message) {
    return Center(child: Text(message));
  }

  Widget _buildMovieGrid(List<Movie> movies) {
    if (movies.isEmpty) {
      return _buildPlaceholderText('No movies found');
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: GridView.builder(
        key: ValueKey(_crossAxisCount),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _crossAxisCount,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
          childAspectRatio: _crossAxisCount == 1 ? 16 / 9 : 2 / 3,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return GestureDetector(
            onTap: () => _navigateToMovieDetails(movie),
            child: Hero(
              tag: 'movie_${movie.id}',
              child: Item(
                movie: movie,
                crossAxisCount: _crossAxisCount,  // Pass the current view mode
              ),
            ),
          );
        },
      ),
    );
  }


  void _navigateToMovieDetails(Movie movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen(movie: movie),
      ),
    );
  }
}
