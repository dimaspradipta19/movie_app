import 'dart:convert';
import 'dart:developer';

// import 'package:dio/dio.dart';
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
        return model;
      } else {
        throw Exception("Cannot load Data");
      }
    } catch (e) {
      log(e.toString());

      return null;
    }
  /* DIO
    try {
      final response = await Dio().get(
          "https://api.themoviedb.org/3/movie/$id?api_key=4c65dcd30f0b84629a0af3d4802ab464&language=en-US");

      if (response.statusCode == 200) {
        var model = DetailModel.fromJson(response.data);
        List<ProductionCompany>? result = model.productionCompanies;
        return result;
      } else {
        throw Exception("Failed load data");
      }
    } catch (e) {
      log(e.toString());
      // returning null
      return null;
    }
    */
  }
}
