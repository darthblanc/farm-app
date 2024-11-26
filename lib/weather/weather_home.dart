import 'package:farm_app/weather/weather_type.dart';
import 'package:flutter/material.dart';

class WeatherHome extends StatelessWidget {
  const WeatherHome({super.key});

  @override
  Widget build(context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 20,
      width: MediaQuery.sizeOf(context).width,
      child: Card(
        color: Colors.black,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const WeatherType()));
          },
          heroTag: "TemperatureHome",
          backgroundColor: Colors.black,
          child: const Row(
            children: [
              Text(
                "  Click for weather information",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              Icon(
                Icons.add,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
