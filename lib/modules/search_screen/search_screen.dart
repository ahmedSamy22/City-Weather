import 'package:city_weather/network/local/cache_helper.dart';
import 'package:city_weather/services/weather_service.dart';
import 'package:city_weather/shared/cubit/cubit.dart';
import 'package:city_weather/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {

 final cityController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit,WeatherStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Search a city'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: cityController,
              decoration: InputDecoration(
                hintText: 'Enter city name',
                label: Text('Search'),
              ),
              onFieldSubmitted: (value) {
                CacheHelper.saveData(key: 'city', value: value);
                WeatherCubit.get(context).getWeather(city: value);
                Navigator.pop(context);
              },
            ),
          ),
        );
      },

    );
  }
}
