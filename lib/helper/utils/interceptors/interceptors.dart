import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce/helper/constants/api_endpoints.dart';
import 'package:e_commerce/helper/constants/apiurl.dart';
import 'package:e_commerce/helper/utils/app_exceptioins.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Interceptorapi {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Dio dio = Dio();

  Future<Dio> getApiUser() async {
    log('interceptor entered');
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await storage.read(key: 'accessToken');
          dio.interceptors.clear();
          options.headers.addAll({"Authorization": "Bearer $token"});
          log('requist ook');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          log('response ook');
          return handler.next(response);
        },
        onError: (DioError e, handler) async {
          if (e.response != null) {
            if (e.response?.statusCode == 403 &&
                e.response?.data['message'] == 'Forbidden') {
              log('token expired');
              RequestOptions requestOptions = e.requestOptions;
              try {
                final refreshToken = await storage.read(key: 'refreshToken');
                log('calling with refreshToken');
                final opts = Options(method: requestOptions.method);
                dio.options.headers["refresh"] = "Bearer $refreshToken";
                final Response response = await dio.get(
                  ApiUrl.apiUrl + ApiEndPoints.refresh,
                  options: opts,
                );
                if (response.statusCode! == 200) {
                  log('new token got');
                  log(response.data.toString());
                  final token = response.data['accessToken'];
                  final refreshToken = response.data['refreshToken'];
                  storage.delete(key: 'token');
                  storage.delete(key: 'refreshToken');
                  storage.write(key: 'refreshToken', value: refreshToken);
                  storage.write(key: 'token', value: token);
                }
              } catch (e) {
                AppExceptions.errorHandler(e);
              }
              try {
                final token = await storage.read(key: 'token');
                final opts = Options(method: requestOptions.method);
                dio.options.headers["Authorization"] = "Bearer $token";
                final response = await dio.request(
                  requestOptions.path,
                  options: opts,
                  cancelToken: requestOptions.cancelToken,
                  onReceiveProgress: requestOptions.onReceiveProgress,
                  data: requestOptions.data,
                  queryParameters: requestOptions.queryParameters,
                );
                return handler.resolve(response);
              } catch (e) {
                AppExceptions.errorHandler(e);
              }
            }
          } else {
            handler.next(e);
          }
        },
      ),
    );
    return dio;
  }
}
