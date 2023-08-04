import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_app/data/service/trending_tv_service.dart';
import 'package:flutter_movie_app/models/trending_tv_model.dart';
import 'package:flutter_movie_app/utils/result_state.dart';

class TrendingTvProvider extends ChangeNotifier {
  TrendingTvService service = TrendingTvService();
  TrendingTvModel? result;
  ResultState state = ResultState.noData;

  Future getTrendingListTv() async {
    try {
      state = ResultState.loading;
      notifyListeners();
      result = await service.getTrendingTvList();

      if (result != null) {
        state = ResultState.hasData;
        notifyListeners();
      } else {
        state = ResultState.noData;
        notifyListeners();
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      rethrow;
    }
  }
}
