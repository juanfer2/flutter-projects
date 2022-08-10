import 'package:flutter/material.dart';
import 'package:segment/src/screens/home_movies.dart';
import 'package:segment/src/screens/movie_detail.dart';

Map<String, WidgetBuilder> getApplicationsRoutes() {
  return <String, WidgetBuilder>{
    '/': (_) => HomeMovies(),
    'movie/details': (_) => MovieDetail(),
  };
}
