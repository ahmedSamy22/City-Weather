import 'package:bloc/bloc.dart';
import 'package:city_weather/models/weather_model.dart';
import 'package:city_weather/services/weather_service.dart';
import 'package:city_weather/shared/components.dart';
import 'package:city_weather/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherCubit extends Cubit<WeatherStates>
{
  WeatherCubit():super(WeatherInitState());
  static WeatherCubit get(context)=> BlocProvider.of(context);

  WeatherModel? weatherModel;
  WeatherService weatherService=WeatherService();

  void getWeather({required String city})
  {
    emit(GetWeatherLoadingState());

    weatherService.getWeather(city: city).then((value) {
      weatherModel=value;
      print(weatherModel.toString());

      emit(GetWeatherSuccessState());

    }).catchError((error){
      print('errooooooorrrr    ${error.toString()}');
      showToast(text: 'No matching location found.', state: ToastStates.WARNING);
      emit(GetWeatherErrorState());
    });
  }
}