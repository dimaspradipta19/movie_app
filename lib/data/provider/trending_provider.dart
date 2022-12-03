import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_app/data/service/trending_service.dart';
import 'package:flutter_movie_app/models/trending_model.dart';
import 'package:flutter_movie_app/utils/result_state.dart';

class TrendingProvider with ChangeNotifier {
  TrendingService service = TrendingService();
  List<Result> result = [];
  ResultState state = ResultState.noData;

  void getTrendingList() async {
    try {
      state = ResultState.loading;
      notifyListeners();
      result = await service.getListTrending() ?? [];

      if (result == []) {
        state = ResultState.noData;
        notifyListeners();
      } else {
        state = ResultState.hasData;
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
