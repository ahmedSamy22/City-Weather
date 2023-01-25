import 'package:city_weather/models/weather_model.dart';
import 'package:city_weather/network/local/cache_helper.dart';
import 'package:city_weather/network/remote/dio_helper.dart';
import 'package:city_weather/shared/cubit/cubit.dart';
import 'package:city_weather/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/home_screen/home_screen.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   var city= CacheHelper.getData(key: 'city');
    return BlocProvider(
      create: (context) => WeatherCubit()..getWeather(city:city),
      child: BlocConsumer<WeatherCubit,WeatherStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          WeatherModel? weatherModel =  WeatherCubit.get(context).weatherModel;
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            theme: ThemeData(
              primarySwatch:weatherModel==null? Colors.blue : weatherModel.getThemeColor(),
            ),
            home: HomeScreen(),
          );
        },

      ),
    );
  }
}
