import 'package:farm_app/crops/crops_home.dart';
import 'package:farm_app/livestock/livestock_home.dart';
import 'package:farm_app/shipment/shipment_home.dart';
import 'package:farm_app/weather/weather_home.dart';
import 'package:flutter/material.dart';
import 'finance/finance_home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Home",
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            const WeatherHome(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 90,
            ),
            Row(
              children: [
                CropsHome(),
                LivestockHome(),
              ],
            ),
            Row(
              children: [
                ShipmentHome(),
                const FinanceHome(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// add functionality to setting button