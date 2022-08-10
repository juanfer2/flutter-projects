import 'package:flutter/material.dart';
import 'package:segment/src/models/models.dart';
import 'package:segment/src/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:segment/src/services/movies_service.dart';

class HomeMovies extends StatelessWidget {
  const HomeMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesService = Provider.of<MoviesService>(context);

    print(moviesService.upcomingMovies);

    return Scaffold(
        appBar: AppBar(
          title: Text('Movies'),
          elevation: 1,
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CardItemWidget(movies: moviesService.onDisplayMovies),
              MovieSlider(
                title: 'Populares',
                movies: moviesService.popularMovies,
                onNextPage: () => moviesService.getPopularMovies(),
              ),
              MovieSlider(
                title: 'Top Rates',
                movies: moviesService.topRatesMovies,
                onNextPage: () => moviesService.getTopRatesMovies(),
              ),
              MovieSlider(
                title: 'Up Coming',
                movies: moviesService.upcomingMovies,
                onNextPage: () => moviesService.getUpcomingMovies(),
              ),
            ],
          ),
        ));
  }
}
