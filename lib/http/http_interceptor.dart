import 'package:dio/dio.dart';

import 'http_exception.dart';

class HttpInterceptor extends Interceptor {
  // 请求拦截
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    super.onRequest(options, handler);
  }

  // 响应拦截
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  // 异常拦截
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // 覆盖异常为自定义的异常类
    HttpException httpException = HttpException.create(err);
    err.error = httpException;

    // TODO: implement onError
    super.onError(err, handler);
  }
}
