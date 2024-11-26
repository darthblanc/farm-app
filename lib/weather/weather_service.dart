import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final urlString = "https://api.openweathermap.org/data/2.5/weather?";
  final endPointKey = "";
  final headerKey = "x-endpoint-key";

  Future<Map<String, dynamic>> fetchData(String apiUrl) async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          'Failed to load data from the API ${response.statusCode}');
    }
  }
}
