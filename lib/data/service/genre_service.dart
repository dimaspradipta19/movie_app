import 'dart:developer';

import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;
import 'package:flutter_movie_app/models/genre_model.dart';

class GenreService {
  Future<List<Genre>?> getListGenre() async {
    /*
    // USING HTTP PACKAGE
    try {
      final response = await http.get(
        Uri.parse(
            "https://api.themoviedb.org/3/genre/movie/list?api_key=4c65dcd30f0b84629a0af3d4802ab464&language=en-US"),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> decodedData = jsonDecode(response.body);
        var model = ListGenreModel.fromJson(decodedData);

        List<Genre>? result = model.genres;
        return result;
      } else {
        throw Exception("Failed load list genre");
      }
    } catch (e) {
      log(e.toString());
      // returning null
      return null;
    }
    */

    // USING DIO PACKAGE
    try {
      final response = await Dio().get(
          "https://api.themoviedb.org/3/genre/movie/list?api_key=4c65dcd30f0b84629a0af3d4802ab464&language=en-US");

      if (response.statusCode == 200) {
        // DIO gak perlu di decode datanya?
        var model = ListGenreModel.fromJson(response.data);
        List<Genre>? result = model.genres;
        return result;
      } else {
        throw Exception("Failed load list genre");
      }
    } catch (e) {
      log(e.toString());
      // returning null
      return null;
    }
  }
}
