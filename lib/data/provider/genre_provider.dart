import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_app/data/service/genre_service.dart';
import 'package:flutter_movie_app/models/genre_model.dart';
import 'package:flutter_movie_app/utils/result_state.dart';

class ListGenreProvider extends ChangeNotifier {
  GenreService service = GenreService();
  List<Genre> result = [];
  ResultState state = ResultState.noData;

  void getList() async {
    try {
      state = ResultState.loading;
      notifyListeners();
      result = await service.getListGenre() ?? [];

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
