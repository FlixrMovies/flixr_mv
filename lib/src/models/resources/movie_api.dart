import 'dart:async';
import 'package:flixr_mv/src/models/movie_item_model.dart';
import 'package:flixr_mv/src/services/url_builder.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

class MovieApiProvider {
  Client client = Client();

  Future<List<MovieItemModel>> fetchMovieList({int? page}) async {
    // print("entered");
    final response =
        await client.get(Uri.parse(UrlBuilder.moviePage(page: page)));
    // print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return MovieItemModel.listFromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load videos.');
    }
  }
}
