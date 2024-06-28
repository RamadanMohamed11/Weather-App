class WeatherModel {
  final num minTemp;
  final num maxTemp;
  final num avgTemp;
  final String iconTitle;
  final String condition;
  final String date;
  final String cityName;
  final String country;
  final String dayDate;
  WeatherModel(
      {required this.dayDate,
      required this.country,
      required this.cityName,
      required this.date,
      required this.minTemp,
      required this.maxTemp,
      required this.iconTitle,
      required this.avgTemp,
      required this.condition});

  factory WeatherModel.fromJson(json, int index) {
    return WeatherModel(
        country: json["location"]["country"],
        cityName: json["location"]["name"],
        date: json["current"]["last_updated"],
        dayDate: json["forecast"]["forecastday"][index]["date"],
        minTemp: json["forecast"]["forecastday"][index]["day"]["mintemp_c"],
        maxTemp: json["forecast"]["forecastday"][index]["day"]["maxtemp_c"],
        iconTitle: json["forecast"]["forecastday"][index]["day"]["condition"]
            ["icon"],
        avgTemp: json["forecast"]["forecastday"][index]["day"]["avgtemp_c"],
        condition: json["forecast"]["forecastday"][index]["day"]["condition"]
            ["text"]);
  }
}
