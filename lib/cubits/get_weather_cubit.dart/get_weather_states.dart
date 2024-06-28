import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherProgressState extends WeatherState {}

class WeatherInfoState extends WeatherState {
  final List<WeatherModel> weatherModels;

  WeatherInfoState({required this.weatherModels});
}

class WeatherErrorState extends WeatherState {
  final String errorMessage;

  WeatherErrorState({required this.errorMessage});
}
