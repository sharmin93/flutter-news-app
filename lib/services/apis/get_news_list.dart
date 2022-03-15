import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../model/news_list_model.dart';
import '../../reusable/constants/urls.dart';
import '../dio_services.dart';

class GetNewsListApi {
  Future<NewsListResponse> getNewsRequest() async {
    final Response response = await getHttp(path: EndPoints.healthUrl);
    if (kDebugMode) {
      print('Response:${response}');
    }
    return NewsListResponse.fromJson(response.data);
  }
}
