import 'dart:convert';
import 'package:uuid/uuid.dart';

class Livestock {
  const Livestock(
      {required this.name,
      required this.type,
      required this.genus,
      required this.species,
      required this.age});

  final String name;
  final String type;
  final String genus;
  final String species;
  final String age;

  factory Livestock.fromJSON(Map<String, dynamic> json) {
    String name = json["name"].toString();
    String type = json["type"].toString();
    String genus = json["genus"].toString();
    String species = json["species"].toString();
    String age = json["age"].toString();
    return Livestock(
        name: name, type: type, genus: genus, species: species, age: age);
  }

  String toJson() {
    final id = const Uuid().v8();
    final data = {
      'id': id,
      'name': name,
      'type': type,
      'genus': genus,
      'species': species,
      'age': age,
    };
    return jsonEncode(data);
  }
}
