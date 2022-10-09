import 'dart:async';
import 'package:flixr_mv/src/models/movie_item_model.dart';
import 'package:flixr_mv/src/services/url_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

class MovieApiProvider {
  Client client = Client();

  Future<MovieResponseData?> fetchMovieList({int? page}) async {
    // print("entered");
    final response =
        await client.get(Uri.parse(UrlBuilder.moviePage(page: page)));
    // print(response.body.toString());
    if (response.statusCode == 200) {
      var body = response.body;
      // If the call to the server was successful, parse the JSON
      if(kDebugMode) print(body);
      return MovieResponseData.fromJson(json.decode(body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load videos. ${response.statusCode} ::: ${response.reasonPhrase}');
    }
  }
}
