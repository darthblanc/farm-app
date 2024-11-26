import 'package:farm_app/weather/weather.dart';
import 'package:farm_app/weather/weather_service.dart';
import 'package:flutter/material.dart';

class WeatherType extends StatefulWidget {
  const WeatherType({super.key});

  @override
  State<WeatherType> createState() => _WeatherTypeState();
}

class _WeatherTypeState extends State<WeatherType> {
  List weatherStats = [];
  final service = WeatherService();

  @override
  initState() {
    super.initState();
    service
        .fetchData(
            "https://api.openweathermap.org/data/2.5/weather?lat=32.46&lon=-96.48&appid=8d20882760bfe419bc02039b138f17c0")
        .then((fetchedList) {
      setState(() {
        Weather instance = Weather.fromJSON(fetchedList);
        weatherStats.add(instance.description);
        weatherStats.addAll(instance.temperatureStats);
        weatherStats.addAll(instance.windStats);
      });
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Stats"),
      ),
      body: ListView.builder(
          itemCount: weatherStats.length,
          itemBuilder: (context, index) {
            String weather = weatherStats[index];
            return Card(
              child: Text(weather, style: const TextStyle(fontSize: 20)),
            );
          }),
      bottomSheet: const Text(
        "Note: Temperatures are in kelvin",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
