import 'package:farm_app/weather/weather.dart';

class WeatherList {
  WeatherList(this.data);
  final List<Weather> data;

  factory WeatherList.fromJSON(List<dynamic> json) {
    final list = json;
    List<Weather> temperatureList = [];
    for (int i = 0; i < list.length; i++) {
      final temperature = Weather.fromJSON(list[i]);
      temperatureList.add(temperature);
    }
    final retList = temperatureList.toList();
    return WeatherList(retList);
  }

  factory WeatherList.fromFullJSON(dynamic json) {
    final list = json["data"] as List<dynamic>;
    return WeatherList.fromJSON(list);
  }
}
