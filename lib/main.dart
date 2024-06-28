import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart/get_weather_cubit.dart';
import 'package:weather_app/screens/home_page.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

MaterialColor getThemeColor(String? weatherCondition) {
  if (weatherCondition == "Sunny") return Colors.red;
  if (weatherCondition == "Partly cloudy") return Colors.blueGrey;
  if (weatherCondition == "Cloudy") return Colors.grey;
  if (weatherCondition == "Overcast") return Colors.blueGrey;
  if (weatherCondition == "Mist") return Colors.lightBlue;
  if (weatherCondition == "Patchy rain possible") return Colors.lightBlue;
  if (weatherCondition == "Patchy snow possible") return Colors.lightBlue;
  if (weatherCondition == "Patchy sleet possible") {
    return Colors.lightBlue;
  }
  if (weatherCondition == "Patchy freezing drizzle possible") {
    return Colors.lightBlue;
  }
  if (weatherCondition == "Thundery outbreaks possible") {
    return Colors.deepOrange;
  }
  if (weatherCondition == "Blowing snow") return Colors.cyan;
  if (weatherCondition == "Blizzard") return Colors.cyan;
  if (weatherCondition == "Fog") return Colors.blueGrey;
  if (weatherCondition == "Freezing fog") return Colors.lightBlue;
  if (weatherCondition == "Patchy light drizzle") return Colors.lightBlue;
  if (weatherCondition == "Light drizzle") return Colors.lightBlue;
  if (weatherCondition == "Freezing drizzle") return Colors.lightBlue;
  if (weatherCondition == "Heavy freezing drizzle") {
    return Colors.lightBlue;
  }
  if (weatherCondition == "Patchy light rain") return Colors.lightBlue;
  if (weatherCondition == "Light rain") return Colors.lightBlue;
  if (weatherCondition == "Moderate rain at times") return Colors.blue;
  if (weatherCondition == "Moderate rain") return Colors.blue;
  if (weatherCondition == "Heavy rain at times") return Colors.indigo;
  if (weatherCondition == "Heavy rain") return Colors.indigo;
  if (weatherCondition == "Light freezing rain") return Colors.lightBlue;
  if (weatherCondition == "Moderate or heavy freezing rain") {
    return Colors.lightBlue;
  }
  if (weatherCondition == "Light sleet") return Colors.lightBlue;
  if (weatherCondition == "Moderate or heavy sleet") {
    return Colors.lightBlue;
  }
  if (weatherCondition == "Patchy light snow") return Colors.lightBlue;
  if (weatherCondition == "Light snow") return Colors.lightBlue;
  if (weatherCondition == "Patchy moderate snow") return Colors.cyan;
  if (weatherCondition == "Moderate snow") return Colors.cyan;
  if (weatherCondition == "Patchy heavy snow") return Colors.cyan;
  if (weatherCondition == "Heavy snow") return Colors.cyan;
  if (weatherCondition == "Ice pellets") return Colors.lightBlue;
  if (weatherCondition == "Light rain shower") return Colors.lightBlue;
  if (weatherCondition == "Moderate or heavy rain shower") return Colors.blue;
  if (weatherCondition == "Torrential rain shower") return Colors.indigo;
  if (weatherCondition == "Light sleet showers") return Colors.lightBlue;
  if (weatherCondition == "Moderate or heavy sleet showers") {
    return Colors.lightBlue;
  }
  if (weatherCondition == "Light snow showers") return Colors.lightBlue;
  if (weatherCondition == "Moderate or heavy snow showers") return Colors.cyan;
  if (weatherCondition == "Light showers of ice pellets") {
    return Colors.lightBlue;
  }
  if (weatherCondition == "Moderate or heavy showers of ice pellets") {
    return Colors.lightBlue;
  }
  if (weatherCondition == "Patchy light rain with thunder") {
    return Colors.deepOrange;
  }
  if (weatherCondition == "Moderate or heavy rain with thunder") {
    return Colors.deepOrange;
  }
  if (weatherCondition == "Patchy light snow with thunder") {
    return Colors.deepOrange;
  }
  if (weatherCondition == "Moderate or heavy snow with thunder") {
    return Colors.deepOrange;
  }
  return Colors.blueGrey; // Default color for unspecified conditions
}
