import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_app/data/service/detail_service.dart';
import 'package:flutter_movie_app/models/detail_model.dart';

import '../../utils/result_state.dart';

class DetailProvider with ChangeNotifier {
  DetailService service = DetailService();
  DetailModel? detailModel;
  ResultState state = ResultState.noData;

  void getDetail(int id) async {
    try {
      state = ResultState.loading;
      notifyListeners();

      detailModel = await service.getDetail(id);

      if (detailModel != null) {
        state = ResultState.hasData;
        notifyListeners();
      } else {
        state = ResultState.noData;
        notifyListeners();
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      // rethrow;
    }
  }
}
