// import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_movie_app/models/search_model.dart';

class SearchService {
  Future<List<Result>?> getSearchMovie(String namaMovie) async {
    /* Use DIO Package
    try {
      final response = await Dio().get(
          "https://api.themoviedb.org/3/search/multi?api_key=4c65dcd30f0b84629a0af3d4802ab464&query=$namaMovie");

      if (response.statusCode == 200) {
        var model = SearchModel.fromJson(response.data);

        List<Result>? result = model.results;
        return result;
      } else {
        throw Exception("Failed to load Search Movie");
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
    */

    try {
      final response = await http.get(Uri.parse(
          "https://api.themoviedb.org/3/search/multi?api_key=4c65dcd30f0b84629a0af3d4802ab464&query=$namaMovie"));

      if (response.statusCode == 200) {
        Map<String, dynamic> decodedData = jsonDecode(response.body);
        var model = SearchModel.fromJson(decodedData);

        List<Result>? result = model.results;
        return result;
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }
}
