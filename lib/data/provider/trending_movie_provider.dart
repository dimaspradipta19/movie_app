import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_app/data/service/trending_movie_service.dart';
import 'package:flutter_movie_app/models/trending_movie_model.dart';
import 'package:flutter_movie_app/utils/result_state.dart';

class TrendingMovieProvider with ChangeNotifier {
  TrendingMovieService service = TrendingMovieService();
  TrendingMovieModel? result;
  ResultState state = ResultState.noData;

  void getTrendingListMovie() async {
    try {
      state = ResultState.loading;
      notifyListeners();
      result = await service.getTrendingMovieList();

      if (result == []) {
        state = ResultState.noData;
        notifyListeners();
      } else {
        state = ResultState.hasData;
        notifyListeners();
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      rethrow;
    }
  }
}
