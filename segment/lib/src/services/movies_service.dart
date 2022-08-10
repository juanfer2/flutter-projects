import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:segment/src/models/popular_response.dart';
import '../models/models.dart';

class MoviesService extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '4aea7450f3811b13f7ac51cf8cadf194';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  List<Movie> topRatesMovies = [];
  List<Movie> upcomingMovies = [];

  Map<int, List<Cast>> moviesCast = {};

  int _popularPage = 1;

  MoviesService() {
    this.getOnDisplayMovies();
    this.getPopularMovies();
    this.getTopRatesMovies();
    this.getUpcomingMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    final url = Uri.https(_baseUrl, endpoint,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);

    return response.body;
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;

    final jsonData = await this._getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);

    moviesCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }

  getOnDisplayMovies() async {
    final jsonData = await this._getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage++;

    print(_popularPage);

    final jsonData = await this._getJsonData('3/movie/popular');
    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovies = [...popularMovies, ...popularResponse.results];

    notifyListeners();
  }

  getTopRatesMovies() async {
    final jsonData = await this._getJsonData('3/movie/top_rated');
    final topRatesResponse = PopularResponse.fromJson(jsonData);

    topRatesMovies = [...topRatesMovies, ...topRatesResponse.results];

    notifyListeners();
  }

  getUpcomingMovies() async {
    final jsonData = await this._getJsonData('3/movie/upcoming');
    final upcomingMoviesResponse = PopularResponse.fromJson(jsonData);

    upcomingMovies = [...upcomingMovies, ...upcomingMoviesResponse.results];

    notifyListeners();
  }
}
