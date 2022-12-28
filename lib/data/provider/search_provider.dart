import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_app/data/service/search_service.dart';
import 'package:flutter_movie_app/models/search_model.dart';
import 'package:flutter_movie_app/utils/result_state.dart';

class SearchProvider extends ChangeNotifier {
  SearchService service = SearchService();
  List<Result> result = [];
  ResultState state = ResultState.noData;

  void getListSearch(String movieName) async {
    try {
      state = ResultState.loading;
      notifyListeners();
      result = await service.getSearchMovie(movieName) ?? [];

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
