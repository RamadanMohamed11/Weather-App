import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  List<WeatherModel>? weatherModels;
  GetWeatherCubit() : super(WeatherInitialState());
  getWeather(String cityName) async {
    try {
      emit(WeatherProgressState());
      weatherModels =
          await WeatherService().getForcastWeather(cityName: cityName);
      emit(WeatherInfoState(weatherModels: weatherModels!));
    } catch (e) {
      // TODO
      emit(WeatherErrorState(errorMessage: e.toString()));
    }
  }

  getWeatherInitalState() {
    emit(WeatherInitialState());
  }
}
