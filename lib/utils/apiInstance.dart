import 'package:dio/dio.dart';
import 'package:zero_mobile/constants/settings.dart';
import 'package:zero_mobile/repositories/userRepository.dart';
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
          if(e.response.statusCode == 401) {
            String refreshToken = await LocalStorage.readLocalStorage('_refreshToken');
            Map<String,dynamic> userResponse = await UserRepository.refreshToken(refreshToken: refreshToken);
            LocalStorage.storeLocalStorage('_token', userResponse['accessToken']);
            LocalStorage.storeLocalStorage('_refreshToken', userResponse['refreshToken']);
          }
          return e;
        }
    ));
    return dio;
  }
}

