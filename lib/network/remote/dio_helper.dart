import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://api.weatherapi.com/v1',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getWeather({
    required String cityName,
  }) async {
    String baseUrl = 'http://api.weatherapi.com/v1';
    String apiKey = '3f8895584c434ff3ab1121336232401';
    String url = ('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');

    return await dio.get(url);
  }
}

//API token
//3f8895584c434ff3ab1121336232401
