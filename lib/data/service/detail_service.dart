import 'dart:developer';
import 'package:dio/dio.dart';
import '../../models/detail_model.dart';

class DetailService {
  Future<DetailModel?> getDetail(int id) async {
    try {
      String apiKey = "4c65dcd30f0b84629a0af3d4802ab464";
      Dio dio = Dio();
      var response = await dio.get(
          "https://api.themoviedb.org/3/movie/$id?api_key=$apiKey&language=en-US");

      if (response.statusCode == 200) {
        var result = DetailModel.fromJson(response.data);
        return result;
      } else {
        throw Exception("Failed load data");
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
