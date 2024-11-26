import 'dart:convert';
import 'package:uuid/uuid.dart';

class Crop {
  const Crop(
      {required this.type,
      required this.genus,
      required this.species,
      required this.area});

  final String type;
  final String genus;
  final String species;
  final String area;

  factory Crop.fromJSON(Map<String, dynamic> json) {
    String type = json["type"].toString();
    String genus = json["genus"].toString();
    String species = json["species"].toString();
    String area = json["area"].toString();
    return Crop(type: type, genus: genus, species: species, area: area);
  }

  String toJson() {
    final id = const Uuid().v8();
    final data = {
      'id': id,
      'type': type,
      'genus': genus,
      'species': species,
      'area': area,
    };
    return jsonEncode(data);
  }
}
