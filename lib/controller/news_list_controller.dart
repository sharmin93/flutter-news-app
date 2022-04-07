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
      final NewsListResponse response = await getNewsListApi.getNewsRequest();
      if (response.status == 'ok') {
        if (response.articles != null && response.articles!.isNotEmpty) {
          newsListResponse = response;
          dataState = DataState.loaded;
        } else {
          dataState = DataState.empty;
        }
      } else {
        dataState = DataState.error;
      }
    } catch (e) {
      dataState = DataState.error;
    }
    notifyListeners();
  }
}
