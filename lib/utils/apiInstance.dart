import 'package:dio/dio.dart';
import 'package:zero_mobile/constants/settings.dart';
import 'package:zero_mobile/utils/localStorage.dart';

class ApiInstance {
  static Dio dio = new Dio();
  static Dio apiInstance()  {
    dio.interceptors.add(InterceptorsWrapper(
        onRequest:(RequestOptions options) async {
          String token = await LocalStorage.readLocalStorage('_token');
          options.baseUrl = settings['apiUrl'];
          options.headers["Authorization"] = "Bearer $token";
          return options;
        },
        onResponse:(Response response) async {
          return response;
        },
        onError: (DioError e) async {
          return e;
        }
    ));
    return dio;
  }
}

