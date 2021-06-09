
import 'package:dio/dio.dart';
import 'package:music_flutter/http/http_request.dart';

class Http {
  /// 初始化公共属性 如果需要覆盖原配置项 就调用它
  ///
  /// [baseUrl] 地址前缀
  /// [connectTimeout] 连接超时赶时间
  /// [receiveTimeout] 接收超时赶时间
  /// [headers] 请求头
  /// [interceptors] 基础拦截器
  static void init({
    String? baseUrl,
    int? connectTimeout,
    int? receiveTimeout,
    Map<String, dynamic>? headers,
    List<Interceptor>? interceptors,
  }) {
    HttpRequest().init(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      headers: headers,
      interceptors: interceptors,
    );
  }

  ///请求头
  static void setHeaders(Map<String, dynamic> headers) {
    HttpRequest().setHeaders(headers);
  }

  ///取消请求
  static void cancle({CancelToken? token}) {
    HttpRequest().cancelRequests(token: token);
  }

   /// restful get 操作
  static Future get(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await HttpRequest().get(
      path,
      params: params,
      options: options,
      cancelToken: cancelToken,
    );
  }


  /// restful post 操作
  static Future post(
    String path, {
    Map<String, dynamic>? params,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {

    Map<String,dynamic> res = await HttpRequest().post(
      path,
      params: params,
      data: data,
      options: options,
      cancelToken: cancelToken,
    );

    return res;
  }


  /// restful post form 表单提交操作
  static Future postForm(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await HttpRequest().postForm(
      path,
      params: params,
      options: options,
      cancelToken: cancelToken,
    );
  }
}
