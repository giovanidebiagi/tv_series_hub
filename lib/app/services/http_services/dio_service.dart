import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tv_series_hub/app/services/http_services/http_errors.dart';
import 'package:tv_series_hub/app/services/http_services/i_http_service.dart';

class DioService implements IHttpService {
  final _dio = Dio();

  @override
  Future get({required String url, var headers, var queryParameters}) async {
    try {
      final _response = await _dio.get(url,
          options: headers != null ? Options(headers: headers) : null,
          queryParameters: queryParameters);

      return jsonEncode(_response.data);
    } on DioError catch (e) {
      if (e.response != null && e.message == 'Http status error [404]') {
        return HttpNotFoundError();
      }

      return HttpCustomError(message: e.message, secondsForRetry: 5);
    }
  }
}
