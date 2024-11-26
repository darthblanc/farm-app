import 'dart:convert';
import 'Livestock_list.dart';
import 'Livestock.dart';
import 'package:http/http.dart' as http;

class LivestockService {
  final urlString = "https://api.restpoint.io/api/farm_app_livestock";
  final endPointKey = "";
  final headerKey = "x-endpoint-key";

  Future<void> insertLivestock(String name, String type, String genus,
      String species, String age) async {
    final livestock = Livestock(
        name: name, type: type, genus: genus, species: species, age: age);
    final body = livestock.toJson();
    final response = await http.post(
      Uri.parse(urlString),
      headers: {
        headerKey: endPointKey,
        'Content-Type': 'application/json',
        'accept': 'application/json',
      },
      body: body,
    );
    if (response.statusCode != 200) {
      throw Exception("failed to insert ${response.statusCode}");
    }
  }

  Future<LivestockList> fetchList() async {
    final response = await http.get(
      Uri.parse(urlString),
      headers: {
        headerKey: endPointKey,
      },
    );
    if (response.statusCode != 200) {
      throw Exception("failed to fetch ${response.statusCode}");
    }
    final jsonBody = response.body;
    final json = jsonDecode(jsonBody);
    return LivestockList.fromFullJSON(json);
  }
}
