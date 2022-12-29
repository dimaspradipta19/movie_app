import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_app/data/service/detail_service.dart';
import 'package:flutter_movie_app/models/detail_model.dart';

import '../../utils/result_state.dart';

class DetailProvider with ChangeNotifier {
  DetailService service = DetailService();
  DetailModel? detailModel;
  // List<ProductionCompany> resultProd = [];
  ResultState state = ResultState.noData;

  void getDetail(String id) async {
    try {
      state = ResultState.loading;
      notifyListeners();
      var result = await service.getDetail(id);

      if (result != null) {
        state = ResultState.hasData;
        // detailModel = result;
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
