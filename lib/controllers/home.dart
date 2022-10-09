import 'package:flixr_mv/app_theme.dart';
import 'package:flixr_mv/get_it.dart';
import 'package:flixr_mv/src/models/resources/movie_api.dart';
import 'package:flixr_mv/src/utils/alerts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../src/models/movie_item_model.dart';
import 'base_notifier.dart';

class HomeChangeNotifier extends BaseNotifier {


  final MovieApiProvider movieApiProvider = MovieApiProvider();
  final appTheme = getIt<AppTheme>();


  MovieResponseData? _movies;
  MovieResponseData? get movies => _movies;
  set movies(MovieResponseData? value) {
    _movies = value;
    notifyListeners();
  }

  int page = 0;

  init() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadVideos();
    });
  }

  loadVideos() async {
    isLoading = true;
    try {
      movies = await movieApiProvider.fetchMovieList(page: page);
    } catch (error, stack) {
      if(kDebugMode) print(stack);
      var e = error as dynamic;
      Alert.error(message: e.toString());
    } finally {
      isLoading = false;
    }
  }
}
