import 'dart:convert';
import 'crop_list.dart';
import 'crop.dart';
import 'package:http/http.dart' as http;

class CropService {
  final urlString = "https://api.restpoint.io/api/farm_app_crops";
  final endPointKey = "";
  final headerKey = "x-endpoint-key";

  Future<void> insertCrop(
      String type, String genus, String species, String area) async {
    final livestock =
        Crop(type: type, genus: genus, species: species, area: area);
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

  Future<CropList> fetchList() async {
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
    return CropList.fromFullJSON(json);
  }
}
