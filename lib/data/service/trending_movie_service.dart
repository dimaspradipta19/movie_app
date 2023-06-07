import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_movie_app/models/trending_movie_model.dart';

class TrendingMovieService {
  // Trending Movie
  Future<TrendingMovieModel?> getTrendingMovieList() async {
    final Dio dio = Dio();
    const String urlResult =
        "https://api.themoviedb.org/3/trending/movie/week?api_key=4c65dcd30f0b84629a0af3d4802ab464";
    try {
      final response = await dio.get(urlResult);

      if (response.statusCode == 200) {
        var result = TrendingMovieModel.fromJson(response.data);
        return result;
      } else {
        throw Exception("Cannot load Data");
      }
    } catch (e) {
      // ignore: avoid_print
      log(e.toString());
      return null;
    }
  }
}
