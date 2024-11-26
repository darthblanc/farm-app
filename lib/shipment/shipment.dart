import 'dart:convert';
import 'package:uuid/uuid.dart';

class Shipment {
  const Shipment(
      {required this.from,
      required this.to,
      required this.type,
      required this.dateIn,
      required this.dateOut});
  final String from;
  final String to;
  final String type;
  final String dateIn;
  final String dateOut;

  factory Shipment.fromJSON(Map<String, dynamic> json) {
    String from = json["from"].toString();
    String to = json["to"].toString();
    String type = json["type"].toString();
    String dateIn = json["dateIn"].toString();
    String dateOut = json["dateOut"].toString();
    return Shipment(
        from: from, to: to, type: type, dateIn: dateIn, dateOut: dateOut);
  }

  String toJson() {
    final id = const Uuid().v8();
    final data = {
      'from': id,
      'to': to,
      'type': type,
      'dateIn': dateIn,
      'dateOut': dateOut,
    };
    return jsonEncode(data);
  }
}
