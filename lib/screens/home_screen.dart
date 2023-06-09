
import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // final popularProvider= Provider.of <MoviesProvider>(context);
    final moviesProvider= Provider.of <MoviesProvider> (context);
    // print(moviesProvider.onDisplayMovies);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en Cines'),
        actions:  [
          IconButton(
            icon:const Icon(Icons.search_outlined),
            onPressed: ()=>showSearch(context: context, delegate: MovieSearchDelegate()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              //tarjetas Principales
             CardMovieSwiper(movies:moviesProvider.onDisplayMovies),
      
             //Sledr de Peliculas
              MovieSlider(movies: moviesProvider.popularMovies),
           
            ]
        ),
      ),
    );
  }
}