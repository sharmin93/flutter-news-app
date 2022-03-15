import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../model/news_list_model.dart';
import '../reusable/enums/enums.dart';
import '../services/apis/get_news_list.dart';

class NewsListController extends ChangeNotifier {
  final GetNewsListApi getNewsListApi = GetNewsListApi();
  NewsListResponse newsListResponse = NewsListResponse();
  int index = 0;
  DataState dataState = DataState.initial;
  getNews() async {
    dataState = DataState.loading;
    try {
      final NewsListResponse res = await getNewsListApi.getNewsRequest();
      if (res != null && res.status == 'ok') {
        newsListResponse = res;
        dataState = DataState.loaded;
      } else {
        dataState = DataState.empty;
      }
      if (kDebugMode) {
        print(res);
      }
      if (kDebugMode) {
        print('newsResponse:  $newsListResponse');
      }
    } catch (e) {
      dataState = DataState.error;
      if (kDebugMode) {
        print('error$e');
      }
    }

    notifyListeners();
  }
}
