import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_movies/presentation/screens/list_screen.dart';
import 'injection.dart';
import 'presentation/blocs/list_bloc.dart';
import 'presentation/blocs/search_bloc.dart';
import 'presentation/blocs/list_event.dart';

void main() {
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Movie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
        ),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<ListBloc>()..add(FetchMovies()),
          ),
          BlocProvider(
            create: (context) => getIt<SearchBloc>(),
          ),
        ],
        child: const ListScreen(),
      ),
    );
  }

}
