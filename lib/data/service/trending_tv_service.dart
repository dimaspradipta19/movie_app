import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../models/trending_tv_model.dart';

class TrendingTvService {
  // Trending TV/Series
  Future<TrendingTvModel?> getTrendingTvList() async {
    try {
      final response = await http.get(
        Uri.parse(
            "https://api.themoviedb.org/3/trending/tv/week?api_key=4c65dcd30f0b84629a0af3d4802ab464"),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> decodedData = jsonDecode(response.body);

        var model = TrendingTvModel.fromJson(decodedData);

        return model;
      } else {
        throw Exception("Cannot load Data");
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }
}
