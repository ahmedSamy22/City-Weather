import 'package:city_weather/models/weather_model.dart';
import 'package:city_weather/modules/search_screen/search_screen.dart';
import 'package:city_weather/shared/cubit/cubit.dart';
import 'package:city_weather/shared/cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  WeatherModel? weatherModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit,WeatherStates>(
      listener: (context, state) {},
      builder: (context, state) {
        weatherModel=WeatherCubit.get(context).weatherModel;
        return Scaffold(
          appBar: AppBar(
            title: Text('Weather',),
            actions: [
              IconButton(onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder:(context) => SearchScreen(),));
              }, icon: Icon(Icons.search)),
            ],

          ),
          body: ConditionalBuilder(
            condition: weatherModel !=null,
            builder: (context)
            {
              return Center(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        weatherModel!.getThemeColor(),
                      weatherModel!.getThemeColor()[50]!,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(flex: 3,),
                        Text('${weatherModel?.city}, ${weatherModel?.country}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26.0,
                        ),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20.0,),
                        Text('${weatherModel?.last_updated}'),
                        const Spacer(flex: 1,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(flex: 1,),
                            Container(
                              height: 100.0,
                                width: 100.0,
                                child: Image(image: AssetImage(weatherModel!.getImage())),),
                            const Spacer(flex: 1,),
                            Text('${weatherModel?.temp.round()}',
                            style: TextStyle(fontSize: 20.0),
                            ),
                            const Spacer(flex: 1,),
                            Column(
                              children: [
                                Text('max:${weatherModel?.maxtemp_c.round()}',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                Text('min:${weatherModel?.mintemp_c.round()}',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                            const Spacer(flex: 1,),
                          ],
                        ),
                        const Spacer(flex: 1,),
                        Text('${weatherModel?.condition}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26.0,
                          ),
                        ),
                        const Spacer(flex: 5,),

                      ],
                    ),
                  ),
                ),
              );
            } ,
            fallback: (context) => Center(
                child: Text('There is no weather, start searching now',)),
          ),
        );
      },
    );
  }
}
