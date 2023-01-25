import 'dart:convert';

import 'package:city_weather/models/weather_model.dart';
import 'package:http/http.dart' as http;
class WeatherService
{
  Future<WeatherModel> getWeather({required String city})async
{

  String baseUrl='http://api.weatherapi.com/v1/';
  String endPoint='forecast.json';
  String key='3f8895584c434ff3ab1121336232401';
  String q=city;
  int days=1;
  Uri url=Uri
      .parse('${baseUrl}${endPoint}?key=${key}&q=${q}&days=${days}');
  http.Response response=await http.get(url);

  Map<String,dynamic> data=jsonDecode(response.body);
  WeatherModel weatherModel=WeatherModel.fromJson(data);
  return weatherModel;

}
}