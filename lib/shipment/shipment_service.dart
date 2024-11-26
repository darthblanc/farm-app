import 'dart:convert';
import 'shipment_list.dart';
import 'shipment.dart';
import 'package:http/http.dart' as http;

class ShipmentService {
  final urlString = "https://api.restpoint.io/api/farm_app_shipments";
  final endPointKey = "";
  final headerKey = "x-endpoint-key";

  Future<void> insertReview(String from, String to, String type, String dateIn,
      String dateOut) async {
    final shipment = Shipment(
        from: from, to: to, type: type, dateIn: dateIn, dateOut: dateOut);
    final body = shipment.toJson();
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

  Future<ShipmentList> fetchList() async {
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
    return ShipmentList.fromFullJSON(json);
  }
}
