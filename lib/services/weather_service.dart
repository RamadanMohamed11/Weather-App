import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final dio = Dio();
  final String baseUrl = "https://api.weatherapi.com/v1";
  final String apiKey = "2205a5b0e7964e84b84211729242206";
  Future<List<WeatherModel>> getForcastWeather(
      {required String cityName, int numberOfDays = 10}) async {
    try {
      final response = await dio.get(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=$numberOfDays&aqi=no&alerts=no');
      Map jsonData = response.data;
      List<WeatherModel> weatherModels = [];
      for (int i = 0; i < jsonData["forecast"]["forecastday"].length; i++) {
        weatherModels.add(WeatherModel.fromJson(jsonData, i));
      }
      return weatherModels;
    } on DioException catch (e) {
      // TODO
      const String errorMessage = "There is an error, try later.";
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception("There is an error, try later.");
    }
  }
}
