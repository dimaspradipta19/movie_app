import 'dart:convert';

import 'package:flutter_movie_app/models/trending_model.dart';
import 'package:http/http.dart' as http;

class TrendingService {
  Future<List<Result>?> getListTrending() async {
    try {
      final response = await http.get(Uri.parse(
          "https://api.themoviedb.org/3/trending/movie/week?api_key=4c65dcd30f0b84629a0af3d4802ab464"));

      if (response.statusCode == 200) {
        Map<String, dynamic> decodedData = jsonDecode(response.body);
        var model = TrendingModel.fromJson(decodedData);

        List<Result> result = model.results;
        return result;
      } else {
        throw Exception("Cannot load Data");
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
