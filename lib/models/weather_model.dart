// class WeatherModel {
//   WeatherModel({
//     required this.location,
//     required this.current,
//     required this.forecast,
//   });
//   late final Location location;
//   late final Current current;
//   late final Forecast forecast;
//
//   WeatherModel.fromJson(Map<String, dynamic> json){
//     location = Location.fromJson(json['location']);
//     current = Current.fromJson(json['current']);
//     forecast = Forecast.fromJson(json['forecast']);
//   }
//
// }
//
// class Location {
//   Location({
//     required this.name,
//     required this.country,
//     required this.localtime,
//   });
//   late final String name;
//   late final String country;
//   late final String localtime;
//
//   Location.fromJson(Map<String, dynamic> json){
//     name = json['name'];
//     country = json['country'];
//     localtime = json['localtime'];
//   }
//
// }
//
// class Current {
//   Current({
//     required this.lastUpdated,
//     required this.tempC,
//     required this.isDay,
//     required this.condition,
//     required this.humidity,
//     required this.cloud,
//
//   });
//
//   late final String lastUpdated;
//   late final int tempC;
//   late final int isDay;
//   late final Condition condition;
//   late final int humidity;
//   late final int cloud;
//
//   Current.fromJson(Map<String, dynamic> json){
//
//     lastUpdated = json['last_updated'];
//     tempC = json['temp_c'];
//     isDay = json['is_day'];
//     condition = Condition.fromJson(json['condition']);
//     humidity = json['humidity'];
//     cloud = json['cloud'];
//   }
//
// }
//
// class Condition {
//   Condition({
//     required this.text,
//     required this.icon,
//
//   });
//   late final String text;
//   late final String icon;
//
//   Condition.fromJson(Map<String, dynamic> json){
//     text = json['text'];
//     icon = json['icon'];
//   }
//
// }
//
// class Forecast {
//   Forecast({
//     required this.forecastday,
//   });
//   late final List<Forecastday> forecastday;
//
//   Forecast.fromJson(Map<String, dynamic> json){
//     forecastday = List.from(json['forecastday']).map((e)=>Forecastday.fromJson(e)).toList();
//   }
//
// }
//
// class Forecastday {
//   Forecastday({
//     required this.date,
//     required this.day,
//     required this.astro,
//   });
//   late final String date;
//   late final Day day;
//   late final Astro astro;
//
//   Forecastday.fromJson(Map<String, dynamic> json){
//     date = json['date'];
//
//     day = Day.fromJson(json['day']);
//     astro = Astro.fromJson(json['astro']);
//   }
//
// }
//
// class Day {
//   Day({
//
//     required this.condition,
//   });
//
//   late final Condition condition;
//
//   Day.fromJson(Map<String, dynamic> json){
//
//     condition = Condition.fromJson(json['condition']);
//   }
//
// }
//
// class Astro {
//   Astro({
//     required this.sunrise,
//     required this.sunset,
//   });
//   late final String sunrise;
//   late final String sunset;
//
//
//   Astro.fromJson(Map<String, dynamic> json){
//     sunrise = json['sunrise'];
//     sunset = json['sunset'];
//   }
//
// }
//
import 'package:flutter/material.dart';

class WeatherModel {
  String city;
  String country;
  String localtime;
  double temp;
  String last_updated;
  String condition;
  double maxtemp_c;
  double mintemp_c;
  String dayCondition;

  WeatherModel({
    required this.city,
    required this.country,
    required this.localtime,
    required this.temp,
    required this.last_updated,
    required this.condition,
    required this.maxtemp_c,
    required this.mintemp_c,
    required this.dayCondition,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    return WeatherModel(
      city: data['location']['name'],
      country: data['location']['country'],
      localtime: data['location']['localtime'],
      temp: data['current']['temp_c'],
      last_updated: data['current']['last_updated'],
      condition: data['current']['condition']['text'],
      maxtemp_c: data['forecast']['forecastday'][0]['day']['maxtemp_c'],
      mintemp_c: data['forecast']['forecastday'][0]['day']['mintemp_c'],
      dayCondition: data['forecast']['forecastday'][0]['day']['condition']['text'],
    );
  }

  @override
  String toString() {
    return 'name=  $city  country=  $country tem = $temp  minTemp = $mintemp_c  date = $last_updated';
  }

  String getImage() {
    if (condition == 'Sunny' || condition == 'Clear' ||  condition == 'partly cloudy') {
      return 'assets/images/clear.png';
    } else if (

    condition == 'Blizzard' ||  condition == 'Patchy snow possible'  ||  condition == 'Patchy sleet possible' || condition == 'Patchy freezing drizzle possible' || condition == 'Blowing snow') {
      return 'assets/images/snow.png';
    } else if (condition == 'Freezing fog' || condition == 'Fog' ||  condition == 'Heavy Cloud' || condition == 'Mist' || condition == 'Fog') {
      return 'assets/images/cloudy.png';
    } else if (condition == 'Patchy rain possible' ||
        condition == 'Heavy Rain' ||
        condition == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (condition == 'Thundery outbreaks possible' || condition == 'Moderate or heavy snow with thunder' || condition == 'Patchy light snow with thunder'|| condition == 'Moderate or heavy rain with thunder' || condition == 'Patchy light rain with thunder' ) {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }
  MaterialColor getThemeColor() {
    if (condition == 'Sunny' || condition == 'Clear' ||  condition == 'partly cloudy') {
      return Colors.orange;
    } else if (
    condition == 'Blizzard' ||  condition == 'Patchy snow possible'
        ||  condition == 'Patchy sleet possible' || condition == 'Patchy freezing drizzle possible'
        || condition == 'Blowing snow') {
      return Colors.blue;
    } else if (condition == 'Freezing fog' || condition == 'Fog' ||  condition == 'Heavy Cloud'
        || condition == 'Mist' || condition == 'Fog') {
      return Colors.blueGrey;
    } else if (condition == 'Patchy rain possible' ||
        condition == 'Heavy Rain' ||
        condition == 'Showers	') {
      return Colors.blue;
    } else if (condition == 'Thundery outbreaks possible'
        || condition == 'Moderate or heavy snow with thunder'
        || condition == 'Patchy light snow with thunder'|| condition == 'Moderate or heavy rain with thunder'
        || condition == 'Patchy light rain with thunder' ) {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }


}
