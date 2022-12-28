import 'dart:convert';

import 'package:flutter_movie_app/models/detail_model.dart';
import 'package:http/http.dart' as http;

class DetailService {
  Future<DetailModel?> getDetail(String id) async {
    try {
      final response = await http.get(
        Uri.parse(
            "https://api.themoviedb.org/3/movie/$id?api_key=4c65dcd30f0b84629a0af3d4802ab464&language=en-US"),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> decodedData = jsonDecode(response.body);
        var model = DetailModel.fromJson(decodedData);

        var result = model;

        return result;
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
